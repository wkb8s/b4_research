#!/bin/bash

NCPU=7
FORK_NUM=32
CALC_NUM=32
LOGSIZE=500
WORKLOAD="IS_YIELD_REPEAT"
# WORKLOAD="IS_CALCULATION"
# WORKLOAD="IS_LARGEWRITE"

POLICIES=(
	"IS_ROUNDROBIN"
	"IS_MULTIPLE_RUNQUEUE"
)
NPROCS=(
	"15000"
	"5000"
	"100"
)

for POLICY in "${POLICIES[@]}" ; do
	for NPROC in "${NPROCS[@]}" ; do
		./scripts/logging.sh $NPROC $NCPU $LOGSIZE $POLICY $WORKLOAD $FORK_NUM $CALC_NUM
	done
done

# draw graph
# (need to prepare all logs)
python3 scripts/plot.py $WORKLOAD $NCPU $LOGSIZE $FORK_NUM
