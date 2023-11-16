#!/bin/bash

LOG_PATH=/home/waka/b4_research/log/tmp.log
MAKEFILE_PATH=/home/waka/b4_research/src/Makefile

NPROC=$1
NCPU=$2
LOG_SIZE=$3
POLICY=$4
WORKLOAD=$5
FORK_NUM=$6
CALC_NUM=$7

# edit Makefile
sed -i "s/CPUS\ :=\ [0-9]*/CPUS\ :=\ $NCPU/" $MAKEFILE_PATH

# generate header files
./scripts/generate_param.sh $NPROC $NCPU $LOG_SIZE > src/param.h
./scripts/generate_flag.sh $POLICY $WORKLOAD $FORK_NUM $CALC_NUM > src/flags.h

if [ $3 == "IS_ROUNDROBIN" ]; then
  (cd src && timeout 5s make --silent qemu-nox < ../scripts/input.txt) | tee $LOG_PATH
else
  (cd src && timeout 7s make --silent qemu-nox < ../scripts/input.txt) | tee $LOG_PATH
fi

# delete unnecessary information
found=false
while IFS= read -r line; do
  sed -i '1d' "$LOG_PATH"
  if [[ $line == *"start printing"* ]]; then
    found=true
    break
  fi
done < "$LOG_PATH"

python3 scripts/evaluate.py
