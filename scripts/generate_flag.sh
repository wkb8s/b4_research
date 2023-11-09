#!/bin/bash

cat << EOF | sed -E "s/($1) 0/\1 1/g; s/($2) 0/\1 1/g"
#define IS_MULTIPLE_RUNQUEUE 0
#define IS_ROUNDROBIN 0

#define IS_YIELD_REPEAT 0
#define IS_CALCULATION 0
#define IS_LARGEWRITE 0

#define FORK_NUM $3
#define CALC_NUM $4
#define CALC_LOOP 100000000
EOF
