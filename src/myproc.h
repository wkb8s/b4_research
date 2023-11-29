// scheduling events
enum events {
  ALLOCPROC,
  WAKEUP,
  YIELD,
  FORK,
  TICK,
  EXIT,
  WAIT,
  SLEEP,
  PTABLE_LOCK,
  RUNQUEUE_LOCK
};

struct clock {
  unsigned int hi; // upper 32 bits
  unsigned int lo; // lower 32 bits
};

struct schedlog {
  int pid;
  int cpu;
  int event_name;
  int prev_pstate;
  int next_pstate;
  struct clock clock;
  char name[16]; // for debugging
};

extern int finished_fork;
extern struct schedlog buf_log[LOG_SIZE];
extern struct clock clock_log[NPROC][3];
