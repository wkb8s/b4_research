#!/bin/bash

WORKLOAD=$1

./scripts/logging.sh 15000 500 IS_ROUNDROBIN $WORKLOAD 32 32
./scripts/logging.sh 5000 500 IS_ROUNDROBIN $WORKLOAD 32 32
./scripts/logging.sh 100 500 IS_ROUNDROBIN $WORKLOAD 32 32

./scripts/logging.sh 15000 500 IS_MULTIPLE_RUNQUEUE $WORKLOAD 32 32
./scripts/logging.sh 5000 500 IS_MULTIPLE_RUNQUEUE $WORKLOAD 32 32
./scripts/logging.sh 100 500 IS_MULTIPLE_RUNQUEUE $WORKLOAD 32 32

if [ $WORKLOAD = "IS_CALCULATION" ]; then
	python3 scripts/plot_calculation.py
elif [ $WORKLOAD = "IS_YIELD_REPEAT" ]; then
	python3 scripts/plot_yieldrepeat.py
elif [ $WORKLOAD = "IS_LARGEWRITE" ]; then
	python3 scripts/plot_largewrite.py
fi
