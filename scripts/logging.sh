#!/bin/bash

LOG_PATH=/home/waka/b4_research/log/tmp.log

# generate header files
./scripts/generate_param.sh $1 $2 > src/param.h
./scripts/generate_flag.sh $3 $4 $5 $6 > src/flags.h

if [ $3 = "IS_ROUNDROBIN" ]; then
  (cd src && timeout 7s taskset -c 0-7 make --silent qemu-nox < ../scripts/input.txt) | tee $LOG_PATH
else
  (cd src && timeout 10s taskset -c 0-7 make --silent qemu-nox < ../scripts/input.txt) | tee $LOG_PATH
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
