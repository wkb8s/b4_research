#include "types.h"
#include "defs.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "x86.h"
#include "proc.h"
#include "spinlock.h"

// added
struct schedlog buf_log[LOGBUFSIZE];
int buf_rest_size = 0;
int push_index;

// added
// get clock
inline struct clock rdtsc(void) {
  /* __asm__ __volatile__("mfence"); */
  unsigned int lo, hi;
  struct clock c;
  __asm__ __volatile__("rdtsc" : "=a"(lo), "=d"(hi));
  c.hi = hi;
  c.lo = lo;
  /* __asm__ __volatile__("mfence"); */
  return c;
}

struct {
  struct spinlock lock;
  struct proc proc[NPROC]; // attention: not sorted by pid
} ptable;

static struct proc *initproc;

int nextpid = 1;
extern void forkret(void);
extern void trapret(void);

static void wakeup1(void *chan);

void pinit(void) {
  initlock(&ptable.lock, "ptable");
}

// Must be called with interrupts disabled
int cpuid() {
  return mycpu() - cpus;
}

// Must be called with interrupts disabled to avoid the caller being
// rescheduled between reading lapicid and running through the loop.
struct cpu *mycpu(void) {
  int apicid, i;

  if (readeflags() & FL_IF)
    panic("mycpu called with interrupts enabled\n");

  apicid = lapicid();
  // APIC IDs are not guaranteed to be contiguous. Maybe we should have
  // a reverse map, or reserve a register to store &cpus[i].
  for (i = 0; i < ncpu; ++i) {
    if (cpus[i].apicid == apicid)
      return &cpus[i];
  }
  panic("unknown apicid\n");
}

// Disable interrupts so that we are not rescheduled
// while reading proc from the cpu structure
struct proc *myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
  c = mycpu();
  p = c->proc;
  popcli();
  return p;
}

int mycpuid(void) {
  pushcli();
  int curcpuid = cpuid();
  popcli();
  return curcpuid;
}

struct runqueue {
  int size;
  struct proc head;
  struct spinlock lock;
};

#define MAX_CPU_NUM 100

struct runqueue runqueue[MAX_CPU_NUM];
struct proc head[MAX_CPU_NUM];

void runqueueinit(void) {
  for (int i = 0; i < ncpu; i++) {
    struct runqueue *rq = &runqueue[i];
    struct proc *head   = &rq->head;
    head->pid           = (-1) * (i + 1);
    head->next          = head;
    head->prev          = head;
    rq->size            = 0;
  }

  push_index = 0;
}

void printrunqueue(void) {
  for (int i = 0; i < ncpu; i++) {
    cprintf("    runqueue %d : pid ", i);
    struct proc *head = &runqueue[i].head;
    struct proc *p    = head->next;
    while (p != head) {
      cprintf("%d, ", p->pid);
      p = p->next;
    }
    cprintf("size %d\n", runqueue[i].size);
  }
  cprintf("\n");
}

struct proc *pop_rq(void) {
  struct runqueue *rq = &runqueue[mycpuid()];
  // error check : pop empty runqueue
  if (rq->size == 0) {
    cprintf("(pid %d, rq %d) ", myproc()->pid, mycpuid());
    panic("pop_rq : empty runqueue");
  }
  struct proc *head     = &rq->head;
  struct proc *p_popped = head->next;
  head->next            = p_popped->next;
  p_popped->next->prev  = head;
  p_popped->next        = NULL;
  p_popped->prev        = NULL;
  rq->size--;
  return p_popped;
}

struct proc *pop_rq_arg(struct runqueue *rq) {
  if (rq->size == 0) {
    cprintf("(pid %d)", myproc()->pid);
    panic("pop_rq : empty runqueue");
  }
  struct proc *head    = &rq->head;
  struct proc *p_poped = head->next;
  head->next           = p_poped->next;
  p_poped->next->prev  = head;
  p_poped->next        = NULL;
  p_poped->prev        = NULL;
  rq->size--;
  return p_poped;
}

void push_rq(struct proc *p) {
  struct proc *head1 = &runqueue[mycpuid()].head;
  struct proc *p1    = head1->next;
  while (p1 != head1) {
    if (p->pid == p1->pid) {
      panic("push same pid");
      return;
    }
    p1 = p1->next;
  }
  struct runqueue *rq = &runqueue[mycpuid()];
  struct proc *head   = &rq->head;
  struct proc *tail   = rq->head.prev;
  rq->size++;
  p->prev    = tail;
  p->next    = head;
  head->prev = p;
  tail->next = p;
}

void push_rq_arg(struct runqueue *rq, struct proc *p) {
  struct proc *head1 = &runqueue[mycpuid()].head;
  struct proc *p1    = head1->next;
  while (p1 != head1) {
    if (p->pid == p1->pid) {
      cprintf("ppid %d, p1pid %d\n", p->pid, p1->pid);
      panic("push same pid");
      return;
    }
    p1 = p1->next;
  }
  struct proc *head = &rq->head;
  struct proc *tail = rq->head.prev;
  rq->size++;
  p->prev    = tail;
  p->next    = head;
  head->prev = p;
  tail->next = p;
}

// added
// from ulib.c
int mystrcmp(const char *p, const char *q) {
  while (*p && *p == *q)
    p++, q++;
  return (uchar)*p - (uchar)*q;
}

// added
void writelog(int pid, char *pname, char event_name, int prev_pstate,
              int next_pstate) {
  if (buf_rest_size > 0 && !mystrcmp(pname, "bufwrite")) {
    buf_rest_size--;
    buf_log[LOGBUFSIZE - buf_rest_size].clock = rdtsc();
    buf_log[LOGBUFSIZE - buf_rest_size].pid   = pid;
    for (int i = 0; i < 16; i++) {
      buf_log[LOGBUFSIZE - buf_rest_size].name[i] = pname[i];
    }
    buf_log[LOGBUFSIZE - buf_rest_size].event_name  = event_name;
    buf_log[LOGBUFSIZE - buf_rest_size].prev_pstate = prev_pstate;
    buf_log[LOGBUFSIZE - buf_rest_size].next_pstate = next_pstate;
    buf_log[LOGBUFSIZE - buf_rest_size].cpu         = mycpuid();
  }
}

// PAGEBREAK: 32
//  Look in the process table for an UNUSED proc.
//  If found, change state to EMBRYO and initialize
//  state required to run in the kernel.
//  Otherwise return 0.
static struct proc *allocproc(void) {
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);

  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
    if (p->state == UNUSED)
      goto found;

  release(&ptable.lock);
  return 0;

found:
  p->pid = nextpid++;

  // added
  p->priority = MAX_PRIO;

  // added
  writelog(p->pid, p->name, ALLOCPROC, p->state, EMBRYO);
  p->state = EMBRYO;

  release(&ptable.lock);

  // Allocate kernel stack.
  if ((p->kstack = kalloc()) == 0) {
    // added
    // what is it mean??
    /* writelog(p->pid, ALLOCEXIT, p->state, UNUSED); */
    p->state = UNUSED;
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
  p->tf = (struct trapframe *)sp;

  // Set up new context to start executing at forkret,
  // which returns to trapret.
  sp -= 4;
  *(uint *)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context *)sp;
  memset(p->context, 0, sizeof *p->context);
  p->context->eip = (uint)forkret;

  return p;
}

// PAGEBREAK: 32
//  Set up first user process.
void userinit(void) {
  struct proc *p;
  extern char _binary_initcode_start[], _binary_initcode_size[];

  p = allocproc();

  initproc = p;
  if ((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
  p->sz = PGSIZE;
  memset(p->tf, 0, sizeof(*p->tf));
  p->tf->cs     = (SEG_UCODE << 3) | DPL_USER;
  p->tf->ds     = (SEG_UDATA << 3) | DPL_USER;
  p->tf->es     = p->tf->ds;
  p->tf->ss     = p->tf->ds;
  p->tf->eflags = FL_IF;
  p->tf->esp    = PGSIZE;
  p->tf->eip    = 0; // beginning of initcode.S

  safestrcpy(p->name, "initcode", sizeof(p->name));
  p->cwd = namei("/");

  // this assignment to p->state lets other cores
  // run this process. the acquire forces the above
  // writes to be visible, and the lock is also needed
  // because the assignment might not be atomic.
  acquire(&ptable.lock);

  // added
  /* writelog(p->pid, USERINIT, p->state, RUNNABLE); */
  p->state = RUNNABLE;
  push_rq(p); // don't forget to push initproc!

  release(&ptable.lock);
}

// Grow current process's memory by n bytes.
// Return 0 on success, -1 on failure.
int growproc(int n) {
  uint sz;
  struct proc *curproc = myproc();

  sz = curproc->sz;
  if (n > 0) {
    if ((sz = allocuvm(curproc->pgdir, sz, sz + n)) == 0)
      return -1;
  } else if (n < 0) {
    if ((sz = deallocuvm(curproc->pgdir, sz, sz + n)) == 0)
      return -1;
  }
  curproc->sz = sz;
  switchuvm(curproc);
  return 0;
}

// Create a new process copying p as the parent.
// Sets up stack to return as if from system call.
// Caller must set state of returned proc to RUNNABLE.
int fork(void) {
  int i, pid;
  struct proc *np;
  struct proc *curproc = myproc();

  // Allocate process.
  if ((np = allocproc()) == 0) {
    return -1;
  }

  // Copy process state from proc.
  if ((np->pgdir = copyuvm(curproc->pgdir, curproc->sz)) == 0) {
    kfree(np->kstack);
    np->kstack = 0;
    np->state  = UNUSED;
    return -1;
  }
  np->sz     = curproc->sz;
  np->parent = curproc;
  *np->tf    = *curproc->tf;

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;

  for (i = 0; i < NOFILE; i++)
    if (curproc->ofile[i])
      np->ofile[i] = filedup(curproc->ofile[i]);
  np->cwd = idup(curproc->cwd);

  safestrcpy(np->name, curproc->name, sizeof(curproc->name));

  pid = np->pid;

  // enqueue
  if (IS_MULTIPLE_RUNQUEUE) {
    /* struct runqueue *push_target = NULL; */
    /* int min_rqsize               = 100; */
    /* for (int i = 0; i < ncpu; i++) { */
    /*   struct runqueue *rq = &runqueue[i]; */
    /*   if (rq->size < min_rqsize) { */
    /*     push_target = rq; */
    /*     min_rqsize  = rq->size; */
    /*   } */
    /* } */
    /* if (push_target != NULL) */
    /*   push_rq_arg(push_target, np); */
    /* else */
    /*   panic("no runqueue to choose"); */

    push_rq_arg(&runqueue[push_index++ % ncpu], np);
  }

  acquire(&ptable.lock);

  // added
  writelog(np->pid, np->name, FORK, np->state, RUNNABLE);
  np->state = RUNNABLE;

  release(&ptable.lock);

  return pid;
}

// Exit the current process.  Does not return.
// An exited process remains in the zombie state
// until its parent calls wait() to find out it exited.
void exit(void) {
  struct proc *curproc = myproc();
  struct proc *p;
  int fd;

  if (curproc == initproc)
    panic("init exiting");

  // Close all open files.
  for (fd = 0; fd < NOFILE; fd++) {
    if (curproc->ofile[fd]) {
      fileclose(curproc->ofile[fd]);
      curproc->ofile[fd] = 0;
    }
  }

  begin_op();
  iput(curproc->cwd);
  end_op();
  curproc->cwd = 0;

  acquire(&ptable.lock);

  // Parent might be sleeping in wait().
  wakeup1(curproc->parent);

  // Pass abandoned children to init.
  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
    if (p->parent == curproc) {
      p->parent = initproc;
      if (p->state == ZOMBIE)
        wakeup1(initproc);
    }
  }

  // added
  writelog(curproc->pid, curproc->name, EXIT, curproc->state, ZOMBIE);

  // Jump into the scheduler, never to return.
  curproc->state = ZOMBIE;
  sched();
  panic("zombie exit");
}

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.
int wait(void) {
  struct proc *p;
  int havekids, pid;
  struct proc *curproc = myproc();

  acquire(&ptable.lock);
  for (;;) {
    // Scan through table looking for exited children.
    havekids = 0;
    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
      if (p->parent != curproc)
        continue;
      havekids = 1;

      // Found one.
      if (p->state == ZOMBIE) {
        // added
        writelog(p->pid, p->name, WAIT, p->state, UNUSED);

        pid = p->pid;
        kfree(p->kstack);
        p->kstack = 0;
        freevm(p->pgdir);
        p->pid     = 0;
        p->parent  = 0;
        p->name[0] = 0;
        p->killed  = 0;
        p->state   = UNUSED;
        release(&ptable.lock);
        return pid;
      }
    }

    // No point waiting if we don't have any children.
    if (!havekids || curproc->killed) {
      release(&ptable.lock);
      return -1;
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock); // DOC: wait-sleep
  }
}

// added
void boost_prio(void) {
  struct proc *p;

  acquire(&ptable.lock);

  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
    p->priority = MAX_PRIO;
  }

  release(&ptable.lock);
}

// PAGEBREAK: 42
//  Per-CPU process scheduler.
//  Each CPU calls scheduler() after setting itself up.
//  Scheduler never returns.  It loops, doing:
//   - choose a process to run
//   - swtch to start running that process
//   - eventually that process transfers control
//       via swtch back to the scheduler.
void scheduler(void) {
  struct proc *p;
  struct cpu *c = mycpu();
  c->proc       = 0;

  // Multiple runqueue scheduler
  while (IS_MULTIPLE_RUNQUEUE) {
    // Enable interrupts on this processor.
    sti();

    struct runqueue *cur_rq = &runqueue[mycpuid()];

    // current runqueue is empty
    if (cur_rq->size == 0) {
      // seek stealing target
      struct runqueue *steal_target = NULL;
      int max_rqsize                = 0;
      for (int i = 0; i < ncpu; i++) {
        struct runqueue *rq = &runqueue[i];
        if (rq->size > max_rqsize) {
          steal_target = rq;
          max_rqsize   = rq->size;
        }
      }
      // steal process
      if (steal_target != NULL && steal_target->size == 0) {
        /* acquire(&steal_target->lock); */
        // steal_target may be vanished by execution
        if (steal_target->size != 0) {
          push_rq_arg(cur_rq, pop_rq_arg(steal_target));
        }
        /* else { */
        /*   cprintf("strictly speaking, it's not work conserving!\n"); */
        /* } */
        /* release(&steal_target->lock); */
      }
    }

    // current runqueue is not empty
    else {
      p       = pop_rq();
      c->proc = p;
      switchuvm(p);
      writelog(p->pid, p->name, TICK, p->state, RUNNING);
      p->state = RUNNING;
      swtch(&(c->scheduler), p->context);
      switchkvm();
      c->proc = 0;
    }
  }

  // MLFQ-like scheduler
  while (IS_MLFQ) {
    // Enable interrupts on this processor.
    sti();
    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
    int sched_idx = 0; // added
    int is_found  = 0;
    for (int search_prio = MAX_PRIO; search_prio >= 0; search_prio--) {
      // search next process
      for (int i = 0; i < NPROC; i++) {
        p        = &ptable.proc[sched_idx];
        is_found = 0;
        if (p->state == RUNNABLE && p->priority == search_prio) {
          is_found = 1;
          c->proc  = p;
          switchuvm(p);
          writelog(p->pid, p->name, TICK, p->state, RUNNING);
          p->state = RUNNING;
          swtch(&(c->scheduler), p->context);
          switchkvm();
          c->proc = 0;
        } else {
          if (sched_idx == NPROC - 1) {
            sched_idx = 0;
          } else {
            sched_idx++;
          }
        }
        if (is_found)
          break;
      }
      if (is_found)
        break;
    }
    release(&ptable.lock);
  }

  // default round robin scheduler
  while (IS_ROUNDROBIN) {
    // Enable interrupts on this processor.
    sti();
    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
      if (p->state == RUNNABLE) {
        c->proc = p;
        switchuvm(p);
        writelog(p->pid, p->name, TICK, p->state, RUNNING);
        p->state = RUNNING;
        swtch(&(c->scheduler), p->context);
        // resume from here (even when initproc is generated)
        switchkvm();
        c->proc = 0; // no process is executed in current CPU
      }
    }
    release(&ptable.lock);
  }
}

// Enter scheduler.  Must hold only ptable.lock
// and have changed proc->state. Saves and restores
// intena because intena is a property of this
// kernel thread, not this CPU. It should
// be proc->intena and proc->ncli, but that would
// break in the few places where a lock is held but
// there's no process.
void sched(void) {
  int intena;
  struct proc *p = myproc();

  if (!holding(&ptable.lock))
    panic("sched ptable.lock");
  if (mycpu()->ncli != 1)
    panic("sched locks");
  if (p->state == RUNNING)
    panic("sched running");
  if (readeflags() & FL_IF)
    panic("sched interruptible");
  intena = mycpu()->intena;

  // added
  if (IS_MULTIPLE_RUNQUEUE) {
    struct cpu *curcpu = mycpu();
    release(&ptable.lock);
    swtch(&p->context, curcpu->scheduler);
    acquire(&ptable.lock);
    curcpu->intena = intena;
  } else {
    swtch(&p->context, mycpu()->scheduler);
    mycpu()->intena = intena;
  }
}

// Give up the CPU for one scheduling round.
void yield(void) {
  struct proc *curproc = myproc();

  // decrease priority
  if (IS_MLFQ && curproc->priority > 0)
    curproc->priority--;

  // added
  writelog(curproc->pid, curproc->name, YIELD, curproc->state, RUNNABLE);

  // enqueue
  if (IS_MULTIPLE_RUNQUEUE)
    push_rq(curproc);

  // change place
  acquire(&ptable.lock); // DOC: yieldlock

  curproc->state = RUNNABLE;
  /* myproc()->state = RUNNABLE; */

  sched();
  release(&ptable.lock);
}

// A fork child's very first scheduling by scheduler()
// will swtch here.  "Return" to user space.
void forkret(void) {
  static int first = 1;
  // Still holding ptable.lock from scheduler.

  if (!IS_MULTIPLE_RUNQUEUE)
    release(&ptable.lock);

  if (first) {
    // Some initialization functions must be run in the context
    // of a regular process (e.g., they call sleep), and thus cannot
    // be run from main().
    first = 0;
    iinit(ROOTDEV);
    initlog(ROOTDEV);
  }

  // Return to "caller", actually trapret (see allocproc).
}

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void sleep(void *chan, struct spinlock *lk) {
  struct proc *p = myproc();

  if (p == 0)
    panic("sleep");

  if (lk == 0)
    panic("sleep without lk");

  // Must acquire ptable.lock in order to
  // change p->state and then call sched.
  // Once we hold ptable.lock, we can be
  // guaranteed that we won't miss any wakeup
  // (wakeup runs with ptable.lock locked),
  // so it's okay to release lk.
  if (lk != &ptable.lock) { // DOC: sleeplock0
    acquire(&ptable.lock);  // DOC: sleeplock1
    release(lk);
  }
  // Go to sleep.
  p->chan = chan;

  // added
  writelog(p->pid, p->name, SLEEP, p->state, SLEEPING);

  p->state = SLEEPING;

  sched();

  // Tidy up.
  p->chan = 0;

  // Reacquire original lock.
  if (lk != &ptable.lock) { // DOC: sleeplock2
    release(&ptable.lock);
    acquire(lk);
  }
}

// PAGEBREAK!
//  Wake up all processes sleeping on chan.
//  The ptable lock must be held.
static void wakeup1(void *chan) {
  struct proc *p;

  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
    if (p->state == SLEEPING && p->chan == chan) {
      // added
      writelog(p->pid, p->name, WAKEUP, p->state, RUNNABLE);

      // enqueue
      if (IS_MULTIPLE_RUNQUEUE)
        push_rq(p);

      p->state = RUNNABLE;
    }
}

// Wake up all processes sleeping on chan.
void wakeup(void *chan) {
  // added
  if (holding(&ptable.lock))
    panic("already locked!\n");

  acquire(&ptable.lock);
  wakeup1(chan);
  release(&ptable.lock);
}

// Kill the process with the given pid.
// Process won't exit until it returns
// to user space (see trap in trap.c).
int kill(int pid) {
  struct proc *p;

  acquire(&ptable.lock);
  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
    if (p->pid == pid) {
      p->killed = 1;
      // Wake process from sleep if necessary.
      if (p->state == SLEEPING) {
        // added
        /* writelog(p->pid, KILL, p->state, RUNNABLE); */
        p->state = RUNNABLE;
      }
      release(&ptable.lock);
      return 0;
    }
  }
  release(&ptable.lock);
  return -1;
}

// PAGEBREAK: 36
//  Print a process listing to console.  For debugging.
//  Runs when user types ^P on console.
//  No lock to avoid wedging a stuck machine further.
void procdump(void) {
  static char *states[] = {
      [UNUSED] "unused",   [EMBRYO] "embryo",  [SLEEPING] "sleep ",
      [RUNNABLE] "runble", [RUNNING] "run   ", [ZOMBIE] "zombie"};
  int i;
  struct proc *p;
  char *state;
  uint pc[10];

  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
    if (p->state == UNUSED)
      continue;
    if (p->state >= 0 && p->state < NELEM(states) && states[p->state])
      state = states[p->state];
    else
      state = "???";
    cprintf("%d %s %s", p->pid, state, p->name);
    if (p->state == SLEEPING) {
      getcallerpcs((uint *)p->context->ebp + 2, pc);
      for (i = 0; i < 10 && pc[i] != 0; i++)
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
  }
}
