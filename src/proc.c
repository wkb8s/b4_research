#include "types.h"
#include "defs.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "x86.h"
#include "proc.h"
#include "myproc.h"
#include "spinlock.h"
#include "flags.h"

struct {
  struct spinlock lock;
  struct proc proc[NPROC];
} ptable;

struct {
  int value;
  struct spinlock lock;
} bufsize;

struct runqueue {
  int size;
  int index_head;
  int index_tail;
  struct spinlock lock;
  struct proc *content[RQ_SIZE];
};

int nextpid            = 1;
int wakeupcnt          = 0;
int steal_num          = 0;
int finished_fork      = 0;
int context_switch_num = 0;
int is_first_running[NPROC];

struct runqueue runqueue[NCPU];
struct runqueue sleepqueue[NCPU];
struct clock clock_log[NPROC][3];
struct schedlog buf_log[LOG_SIZE];
static struct proc *initproc;

extern void forkret(void);
extern void trapret(void);
static void wakeup1(void *chan);
static void wakeup2(void *chan);

// record clock
inline struct clock rdtsc(void) {
  unsigned int lo, hi;
  struct clock c;
  __asm__ __volatile__("rdtsc" : "=a"(lo), "=d"(hi));
  c.hi = hi;
  c.lo = lo;
  return c;
}

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

void myinit(void) {
  for (int i = 0; i < NPROC; i++)
    is_first_running[i] = 1;

  bufsize.value = 0;

  // init runqueue
  for (int i = 0; i < NCPU; i++) {
    struct runqueue *rq = &runqueue[i];
    rq->size            = 0;
    rq->index_head      = 0;
    rq->index_tail      = 0;
    initlock(&rq->lock, "runqueue");
    for (int j = 0; j < RQ_SIZE; j++)
      rq->content[j] = NULL;
  }

  // init sleepqueue
  for (int i = 0; i < NCPU; i++) {
    struct runqueue *slpq = &sleepqueue[i];
    slpq->size            = 0;
    slpq->index_head      = 0;
    slpq->index_tail      = 0;
    initlock(&slpq->lock, "sleepqueue");
    for (int j = 0; j < RQ_SIZE; j++)
      slpq->content[j] = NULL;
  }
}

// for debugging
void printqueue(struct runqueue *queue) {
  cprintf("%s\n", queue->lock.name);
  for (int i = 0; i < ncpu; i++) {
    struct runqueue *q = &queue[i];
    cprintf("queue %d: ", i);
    for (int j = 0; j < RQ_SIZE; j++) {
      if (q->content[j] != NULL)
        cprintf("%d, ", q->content[j]->pid);
    }
    cprintf("\n");
  }
  cprintf("\n");
}

// Must be called with rq->lock
void enqueue(struct runqueue *rq, struct proc *p) {
  if (IS_DEBUG) {
    if (!holding(&rq->lock))
      panic("enqueue : no lock");
  }
  if (!IS_MULTIPLE_RUNQUEUE)
    panic("enqueue : invalid policy");
  if (rq->size++ > RQ_SIZE)
    panic("enqueue : full runqueue");
  if (rq->content[rq->index_tail] != NULL)
    panic("enqueue : already exist");
  /* if (p->state != RUNNABLE && p->state != SLEEPING) { */
  /*   cprintf("enqueue : p->state is %d\n", p->state); */
  /*   panic("enqueue : invalid proc state"); */
  /* } */

  /* for (int i = 0; i < ncpu; i++) { */
  /*   struct cpu *c = &cpus[i]; */
  /*   if (c->proc == p) { */
  /*     cprintf("name %s\n", rq->lock.name); */
  /*     cprintf("cpu[%d], pid %d, state %d\n", i, p->pid, p->state); */
  /*     panic("enqueue: invalid cpu state"); */
  /*   } */
  /* } */

  /* if (rq->lock.name[0] == 'r') */
  /*   cprintf("enqueued in runqueue[%d] : pid %d\n", mycpuid(), p->pid); */

  /* printrq(); */

  rq->content[rq->index_tail] = p;
  rq->index_tail              = (rq->index_tail + 1) % RQ_SIZE; // ring-buffer
}

// Must be called with rq->lock
struct proc *dequeue(struct runqueue *rq) {
  struct proc *head = rq->content[rq->index_head];

  if (IS_DEBUG) {
    if (!holding(&rq->lock))
      panic("dequeue : no lock");
  }
  if (!IS_MULTIPLE_RUNQUEUE)
    panic("dequeue : invalid policy");
  if (rq->size-- < 1)
    panic("dequeue : empty runqueue");
  if (head == NULL)
    panic("dequeue : no proc");
  /* if (head->state != RUNNABLE && head->state != SLEEPING) { */
  /*   cprintf("dequeue : p->state is %d\n", head->state); */
  /*   panic("dequeue : invalid proc state"); */
  /* } */
  /* for (int i = 0; i < ncpu; i++) { */
  /*   struct runqueue *rq = &runqueue[i]; */
  /*   if (rq->size != 0) */
  /*     break; */
  /*   if (i == ncpu - 1) */
  /*     cprintf("dequeue : all rq became vacant\n"); */
  /* } */

  /* for (int i = 0; i < ncpu; i++) { */
  /*   struct cpu *c = &cpus[i]; */
  /*   if (c->proc == head) { */
  /*     cprintf("name %s\n", rq->lock.name); */
  /*     cprintf("cpu[%d], pid %d, state %d\n", i, head->pid, head->state); */
  /*     panic("dequeue: invalid cpu state"); */
  /*   } */
  /* } */

  /* if (rq->lock.name[0] == 'r') */
  /*   cprintf("dequeued in runqueue[%d] : pid %d\n", mycpuid(), head->pid);
   */

  /* printrq(); */

  rq->content[rq->index_head] = NULL;
  rq->index_head              = (rq->index_head + 1) % RQ_SIZE; // ring-buffer
  return head;
}

void slpenqueue(struct runqueue *rq, struct proc *p) {
  if (!IS_MULTIPLE_RUNQUEUE)
    panic("slpenqueue : invalid policy");
  if (rq->size++ > RQ_SIZE)
    panic("slpenqueue : full runqueue");
  if (rq->content[rq->index_tail] != NULL)
    panic("slpenqueue : already exist");

  rq->content[rq->index_tail] = p;
  rq->index_tail              = (rq->index_tail + 1) % RQ_SIZE; // ring-buffer
}

struct proc *slpdequeue(struct runqueue *rq) {
  struct proc *head = rq->content[rq->index_head];

  if (!IS_MULTIPLE_RUNQUEUE)
    panic("slpdequeue : invalid policy");
  if (rq->size-- < 1)
    panic("slpdequeue : empty runqueue");
  if (head == NULL)
    panic("slpdequeue : no proc");

  rq->content[rq->index_head] = NULL;
  rq->index_head              = (rq->index_head + 1) % RQ_SIZE; // ring-buffer
  return head;
}

void writelog(int pid, char event_name, int prev_pstate, int next_pstate) {
  if (IS_CALCULATION &&
      (!finished_fork || pid < PARENT_PID || pid > PARENT_PID + FORK_NUM))
    return;
  if (IS_YIELD_REPEAT &&
      (!finished_fork || pid < PARENT_PID || pid > PARENT_PID + FORK_NUM))
    return;
  if (IS_LARGEWRITE && (pid != PARENT_PID))
    return;

  if (bufsize.value >= LOG_SIZE)
    return;
  acquire(&bufsize.lock);
  if (bufsize.value >= LOG_SIZE) {
    release(&bufsize.lock);
    return;
  }
  int index = bufsize.value++;
  release(&bufsize.lock);

  buf_log[index].clock       = rdtsc();
  buf_log[index].cpu         = mycpuid();
  buf_log[index].event_name  = event_name;
  buf_log[index].prev_pstate = prev_pstate;
  buf_log[index].next_pstate = next_pstate;
  buf_log[index].pid         = pid;
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
  p->state = EMBRYO;
  p->pid   = nextpid++;
  release(&ptable.lock);

  writelog(p->pid, ALLOCPROC, UNUSED, EMBRYO);

  // Allocate kernel stack.
  if ((p->kstack = kalloc()) == 0) {
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

  // why ptable.lock is unnecessary???

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
  p->state = RUNNABLE;
  release(&ptable.lock);

  if (!IS_MULTIPLE_RUNQUEUE)
    return;

  // don't forget to enqueue initproc!
  struct runqueue *cur_rq = &runqueue[mycpuid()];
  acquire(&cur_rq->lock);
  enqueue(cur_rq, p);
  release(&cur_rq->lock);
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

  clock_log[np->pid][0] = rdtsc();

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

  writelog(np->pid, FORK, np->state, RUNNABLE);
  acquire(&ptable.lock);
  np->state = RUNNABLE;
  release(&ptable.lock);

  if (IS_ROUNDROBIN)
    return pid;

  // seek smallest runqueue
  // but, best effort
  struct runqueue *target = NULL;
  int min_rqsize          = NPROC + 1;

  for (int i = 0; i < NCPU; i++) {
    struct runqueue *rq = &runqueue[i];
    if (rq->size < min_rqsize) {
      target     = rq;
      min_rqsize = rq->size;
    }
  }

  if (target == NULL || min_rqsize == NPROC + 1)
    panic("fork: enqueue failed");

  acquire(&target->lock);
  enqueue(target, np);
  release(&target->lock);

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

  /* cprintf("exit called\n"); */

  writelog(curproc->pid, EXIT, RUNNING, ZOMBIE);

  // for sleepqueue
  if (IS_SLPQ) {
    wakeup2(curproc->parent);
    // repeating acquire() has large overhead
    acquire(&ptable.lock);
    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
      if (p->parent != curproc)
        continue;

      if (p->parent == curproc) {
        p->parent = initproc;
        if (p->state == ZOMBIE)
          wakeup2(initproc);
      }
    }
    clock_log[curproc->pid][2] = rdtsc();
  }

  // for default
  else {
    acquire(&ptable.lock);
    // Parent might be sleeping in wait().
    wakeup1(curproc->parent);
    // Pass abandoned children to init.
    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
      // 'p' is child of curproc
      if (p->parent == curproc) {
        p->parent = initproc;
        // wakeup initproc to clean up 'p'
        if (p->state == ZOMBIE)
          wakeup1(initproc);
      }
    }
    clock_log[curproc->pid][2] = rdtsc();
  }

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
        writelog(pid, WAIT, ZOMBIE, UNUSED);
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

// * has something wrong
struct proc *worksteal(struct runqueue *cur_rq) {
  struct runqueue *target = NULL;
  struct proc *ret        = NULL;
  int maxsize             = 0;

  // seek target
  for (int i = 0; i < NCPU; i++) {
    struct runqueue *rq = &runqueue[i];
    int size            = rq->size; // rq->size is not atomic
    if (size > maxsize && rq != cur_rq) {
      target  = rq;
      maxsize = size;
    }
  }

  if (target == NULL || maxsize == 0)
    return NULL;
  if (target == cur_rq)
    panic("work_steal: steal myself");

  // steal process
  // target may be vanished by execution or stealing
  acquire(&target->lock);
  if (target->size > 0) {
    ret = dequeue(target);

    /* if (ret->state != RUNNABLE) */
    /*   panic("worksteal: invalid proc state"); */
    /* if (ret == NULL) */
    /*   panic("worksteal: ret is NULL"); */

    /* for (int i = 0; i < ncpu; i++) { */
    /*   struct cpu *c = &cpus[i]; */
    /*   if (c->proc == ret) { */
    /*     cprintf("cpu[%d], pid %d, ret->state %d\n", i, ret->pid,
     * ret->state);
     */
    /*     panic("worksteal: invalid cpu state"); */
    /*   } */
    /* } */

    /* release(&target->lock); */
    steal_num++;
    /* return ret; */
  }
  release(&target->lock);
  return ret;
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
  struct cpu *c           = mycpu();
  struct runqueue *cur_rq = &runqueue[c - cpus];
  c->proc                 = 0;

  /* cprintf("start scheduler %d\n", c - cpus); */
  /* int x = 0; */

  // Multiple runqueue scheduler
  while (IS_MULTIPLE_RUNQUEUE) {
    /* x = (x + 1) % 1000000; */
    /* if (x == 500) */
    /*   cprintf("duler() called\n"); */

    // Enable interrupts on this processor.
    sti();

    if (cur_rq->size == 0) {
      if ((p = worksteal(cur_rq)) == NULL)
        continue;
    } else {
      acquire(&cur_rq->lock);
      if (cur_rq->size == 0) {
        release(&cur_rq->lock);
        continue;
      }
      p = dequeue(cur_rq);
      release(&cur_rq->lock);
    }

    c->proc = p;
    switchuvm(p);

    // no lock needed because written only once
    if (is_first_running[p->pid]) {
      clock_log[p->pid][1]     = rdtsc();
      is_first_running[p->pid] = 0;
    }

    acquire(&ptable.lock);
    writelog(p->pid, TICK, RUNNABLE, RUNNING);
    p->state = RUNNING;
    swtch(&(c->scheduler), p->context);
    context_switch_num++;
    c->proc = 0; // makeshift solution
    release(&ptable.lock);
    switchkvm();
    // c->proc = 0; // true place
  }

  // default round robin scheduler
  while (IS_ROUNDROBIN) {
    // Enable interrupts on this processor.
    sti();
    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
      if (p->state != RUNNABLE)
        continue;

      c->proc = p;
      switchuvm(p);

      // no lock needed because written only once
      if (is_first_running[p->pid]) {
        clock_log[p->pid][1]     = rdtsc();
        is_first_running[p->pid] = 0;
      }

      writelog(p->pid, TICK, RUNNABLE, RUNNING);
      p->state = RUNNING;
      swtch(&(c->scheduler), p->context);
      context_switch_num++;
      switchkvm();
      c->proc = 0; // no process is executed in current CPU
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

  if (IS_DEBUG) {
    if (!holding(&ptable.lock))
      panic("sched ptable.lock");
  }
  if (mycpu()->ncli != 1)
    panic("sched locks");
  if (p->state == RUNNING)
    panic("sched running");
  if (readeflags() & FL_IF)
    panic("sched interruptible");

  intena = mycpu()->intena;
  context_switch_num++;
  swtch(&p->context, mycpu()->scheduler);
  mycpu()->intena = intena;
}

// Give up the CPU for one scheduling round.
void yield(void) {
  struct proc *curproc    = myproc();
  struct runqueue *cur_rq = &runqueue[mycpuid()];

  writelog(curproc->pid, YIELD, RUNNING, RUNNABLE);
  acquire(&ptable.lock);
  curproc->state = RUNNABLE;

  // [???] average running clock decreases in multiple runqueue
  /* volatile int x = 0; */
  /* for (int i = 0; i < 10000; i++) */
  /*   x++; */

  if (IS_MULTIPLE_RUNQUEUE) {
    /* for (int i = 0; i < ncpu; i++) { */
    /*   struct cpu *c = &cpus[i]; */
    /*   if (c->proc == curproc) { */
    /*     cprintf("cpu[%d], pid %d, ret->state %d\n", i, curproc->pid, */
    /*             curproc->state); */
    /*     panic("yield: invalid cpu state"); */
    /*   } */
    /* } */
    // acquire/release has overhead
    /* release(&ptable.lock); */
    acquire(&cur_rq->lock);
    enqueue(cur_rq, curproc);
    release(&cur_rq->lock);
    /* acquire(&ptable.lock); */
  }
  sched();
  release(&ptable.lock);
  curproc = myproc();

  // if placed here, response time increases
  /* writelog(curproc->pid, TICK, RUNNABLE, RUNNING); */
}

// A fork child's very first scheduling by scheduler()
// will swtch here.  "Return" to user space.
void forkret(void) {
  static int first = 1;
  // Still holding ptable.lock from scheduler.
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
  struct proc *p            = myproc();
  struct runqueue *cur_slpq = &sleepqueue[mycpuid()];

  if (p == 0)
    panic("sleep");

  if (lk == 0)
    panic("sleep without lk");

  writelog(p->pid, SLEEP, p->state, SLEEPING);

  // is it okay to place here?
  if (IS_SLPQ) {
    acquire(&cur_slpq->lock);
    slpenqueue(cur_slpq, p);
    release(&cur_slpq->lock);
  }

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
  p->chan  = chan;
  p->state = SLEEPING;

  sched();

  // Tidy up.
  p->chan = 0;

  // Reacquire original lock.
  if (lk != &ptable.lock) { // DOC: sleeplock2
    release(&ptable.lock);
    acquire(lk);
  }

  // if placed here, response time increases
  /* writelog(myproc()->pid, TICK, RUNNABLE, RUNNING); */
}

// PAGEBREAK!
//  Wake up all processes sleeping on chan.
//  The ptable lock must be held.
static void wakeup1(void *chan) {
  struct proc *p;
  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
    if (p->state == SLEEPING && p->chan == chan) {
      writelog(p->pid, WAKEUP, p->state, RUNNABLE);
      p->state = RUNNABLE;
      if (IS_MULTIPLE_RUNQUEUE) {
        struct runqueue *cur_rq = &runqueue[mycpuid()];
        acquire(&cur_rq->lock);
        enqueue(cur_rq, p);
        release(&cur_rq->lock);
      }
      wakeupcnt++;
    }
}

// for multiple runqueue
// ptable.lock free
static void wakeup2(void *chan) {
  struct proc *p;

  for (int j = 0; j < NCPU; j++) {
    struct runqueue *cur_rq   = &runqueue[j];
    struct runqueue *cur_slpq = &sleepqueue[j];

    for (int i = 0; i < RQ_SIZE; i++) {
      if (cur_slpq->size == 0)
        break;

      acquire(&cur_slpq->lock);
      p = slpdequeue(cur_slpq);
      release(&cur_slpq->lock);
      /* if (p->chan != chan) { */
      /*   enqueue(cur_slpq, p); */
      /*   continue; */
      /* } */

      writelog(p->pid, WAKEUP, p->state, RUNNABLE);

      acquire(&ptable.lock);
      p->state = RUNNABLE;
      release(&ptable.lock);

      acquire(&cur_rq->lock);
      enqueue(cur_rq, p);
      release(&cur_rq->lock);

      wakeupcnt++;
    }
  }
}

void wakeup(void *chan) {
  if (IS_DEBUG) {
    if (holding(&ptable.lock))
      panic("wakeup: already locked!\n");
  }

  if (IS_SLPQ) {
    wakeup2(chan);
    return;
  }

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
