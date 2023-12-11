#define IS_DEBUG 0
#define IS_SLPQ 0

#define IS_MULTIPLE_RUNQUEUE 0
#define IS_ROUNDROBIN 1

#define IS_YIELD_REPEAT 1
#define IS_CALCULATION 0
#define IS_LARGEWRITE 0

#define FORK_NUM 32
#define CALC_NUM 32
#define CALC_LOOP 100000000

extern int context_switch_num;
extern int steal_num;
