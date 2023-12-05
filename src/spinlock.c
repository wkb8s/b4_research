// Mutual exclusion spin locks.

#include "types.h"
#include "defs.h"
#include "param.h"
#include "x86.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"
#include "myproc.h"
#include "spinlock.h"
#include "flags.h"

/* struct lock_time_log lock_time_log; */

void initlock(struct spinlock *lk, char *name) {
  lk->name   = name;
  lk->locked = 0;
  lk->cpu    = 0;
}

/* inline struct clock rdtsc2(void) { */
/*   unsigned int lo, hi; */
/*   struct clock c; */
/*   __asm__ __volatile__("rdtsc" : "=a"(lo), "=d"(hi)); */
/*   c.hi = hi; */
/*   c.lo = lo; */
/*   return c; */
/* } */

/* char *safestrcpy2(char *s, const char *t, int n) { */
/*   char *os; */

/*   os = s; */
/*   if (n <= 0) */
/*     return os; */
/*   while (--n > 0 && (*s++ = *t++) != 0) */
/*     ; */
/*   *s = 0; */
/*   return os; */
/* } */

/* int index = 0; */
/* void record_waiting_clock(struct spinlock *lk, int is_start) { */
/*   if (index++ == 300) */
/*     return; */

/*   lock_time_log.is_start     = is_start; */
/*   lock_time_log.clock[index] = rdtsc2(); */
/*   safestrcpy2(lock_time_log.name, lk->name, sizeof(lock_time_log.name)); */
/* } */

// Acquire the lock.
// Loops (spins) until the lock is acquired.
// Holding a lock for a long time may cause
// other CPUs to waste time spinning to acquire it.
void acquire(struct spinlock *lk) {
  pushcli(); // disable interrupts to avoid deadlock.

  // has large overhead
  if (IS_DEBUG) {
    if (holding(lk)) {
      cprintf("panic acquire, lockname:%s\n", lk->name);
      panic("acquire");
    }
  }

  // The xchg is atomic.
  while (xchg(&lk->locked, 1) != 0)
    ;

  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
  __sync_synchronize();

  // Record info about lock acquisition for debugging.
  if (IS_DEBUG) {
    lk->cpu = mycpu();
    getcallerpcs(&lk, lk->pcs);
  }
}

// Release the lock.
void release(struct spinlock *lk) {
  // has large overhead
  if (IS_DEBUG) {
    if (!holding(lk)) {
      cprintf("panic release, lockname:%s\n", lk->name);
      panic("release");
    }
  }

  lk->pcs[0] = 0;
  lk->cpu    = 0;

  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that all the stores in the critical
  // section are visible to other cores before the lock is released.
  // Both the C compiler and the hardware may re-order loads and
  // stores; __sync_synchronize() tells them both not to.
  __sync_synchronize();

  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m"(lk->locked) :);

  popcli();
}

// Record the current call stack in pcs[] by following the %ebp chain.
void getcallerpcs(void *v, uint pcs[]) {
  uint *ebp;
  int i;

  ebp = (uint *)v - 2;
  for (i = 0; i < 10; i++) {
    if (ebp == 0 || ebp < (uint *)KERNBASE || ebp == (uint *)0xffffffff)
      break;
    pcs[i] = ebp[1];         // saved %eip
    ebp    = (uint *)ebp[0]; // saved %ebp
  }
  for (; i < 10; i++)
    pcs[i] = 0;
}

// Check whether this cpu is holding the lock.
int holding(struct spinlock *lock) {
  int r;
  pushcli();
  r = lock->locked && lock->cpu == mycpu();
  popcli();
  return r;
}

// Pushcli/popcli are like cli/sti except that they are matched:
// it takes two popcli to undo two pushcli.  Also, if interrupts
// are off, then pushcli, popcli leaves them off.

void pushcli(void) {
  int eflags;

  eflags = readeflags();
  cli();
  if (mycpu()->ncli == 0)
    mycpu()->intena = eflags & FL_IF;
  mycpu()->ncli += 1;
}

void popcli(void) {
  if (readeflags() & FL_IF)
    panic("popcli - interruptible");
  if (--mycpu()->ncli < 0)
    panic("popcli");
  if (mycpu()->ncli == 0 && mycpu()->intena)
    sti();
}

