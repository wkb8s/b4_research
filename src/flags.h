// policy: you can enable only one of them
#define IS_MULTIPLE_RUNQUEUE 1
#define IS_ROUNDROBIN 0

// workload: you can enable only one of them
#define IS_YIELD_REPEAT 1
#define IS_CALCULATION 0

// also need to modify sys_bufwrite() in sysfile.c
#define FORK_NUM 32
#define CALC_NUM 32
#define CALC_LOOP 100000000
