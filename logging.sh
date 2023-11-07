#!/bin/bash

LOG_PATH=/home/waka/b4_research/log/tmp.log
SUMMARY_PATH=/home/waka/b4_research/log/summary.md

{
  (cd src && taskset -c 0-7 make qemu-nox) | tee $LOG_PATH
  # (cd src && taskset -c 0-7 make qemu-nox < ../input.txt) | tee test.log
} && {

  # delete unnecessary information
  found=false
  while IFS= read -r line; do
    sed -i '1d' "$LOG_PATH"
    if [[ $line == *"bufread"* ]]; then
      found=true
      break
    fi
  done < "$LOG_PATH"

  python3 scripts/evaluate.py >> $SUMMARY_PATH
}
