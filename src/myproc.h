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

/* struct lock_time_log { */
/*   int is_start; */
/*   struct clock clock[300]; */
/*   char *name; */
/* }; */

extern int finished_fork;
extern struct schedlog buf_log[LOG_SIZE];
extern struct clock clock_log[NPROC][3];
/* extern struct lock_time_log lock_time_log; */

extern int wakeupcnt;
