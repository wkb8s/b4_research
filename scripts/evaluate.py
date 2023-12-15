import os
import sys
import yaml
import math
import shutil
import subprocess
import numpy as np
import pandas as pd
from enum import Enum
from datetime import datetime

RUNNABLE = 3
RUNNING = 4

# get args
args = sys.argv
if (len(args) != 10):
    print("python3 scripts/evaluate.py NCPU NPROC POLICY LOG_SIZE WORKLOAD FORK_NUM CALC_NUM REPEAT_INDEX WORKLOAD_INDEX")
    exit(1)
NCPU = int(args[1])
NPROC = args[2]
policy = args[3]
LOGSIZE = int(args[4])
workload = args[5]
FORK_NUM = args[6]
repeat_index = args[8]
workload_index = args[9]

input_path = 'log/tmp.log'
logfile_path = 'log/log.csv'
logclock_path = 'log/clock.csv'
output_name = "log/" + workload + "/" + policy \
    + "_cpu" + str(NCPU) + "_nproc" + str(NPROC) + "_fork" \
    + str(FORK_NUM) + "_logsize" + str(LOGSIZE) + "/"

# largewrite
if (workload_index == "1"):
    FORK_NUM = ''

# split inputfile to csv
input_file = pd.read_csv(input_path)
input_file.iloc[:LOGSIZE:].to_csv(logfile_path, index=False)
input_file.iloc[LOGSIZE:LOGSIZE + 65:] \
    .to_csv(logclock_path, header=False, index=False)
df = pd.read_csv(logfile_path, header=0)
df_clock = pd.read_csv(logclock_path, header=0)

# use decimal and elapsed clock
# and extract RUNNING infomation
df['clock'] = df['clock'].apply(lambda x: int(x, 16))
df = df.sort_values('clock')
df['clock'] -= df['clock'].min()
df_clock['fork'] = df_clock['fork'].apply(lambda x: int(x, 16))
df_clock['run'] = df_clock['run'].apply(lambda x: int(x, 16))
df_clock['exit'] = df_clock['exit'].apply(lambda x: int(x, 16))
df = df.query('pstate_prev == 4 or pstate_next == 4') \
    .loc[:,['clock', 'cpu', 'pid', 'pstate_prev', 'pstate_next']] \
    .astype('int')

INIT_NUM = -999
prev_clock = [0] * NCPU
cnt_running = cnt_not_running = sum_running = sum_not_running = 0
running_clock = [0] * NCPU
not_running_clock = [0] * NCPU
cpu_start_clock = [INIT_NUM] * NCPU
cpu_end_clock = [0] * NCPU

# get CPU usage
for line in df.itertuples(name=None, index=False):
    clock, cpuid, pid, pstate_prev, pstate_next = line[:5]
    lapsed_clock = clock - prev_clock[cpuid]
    prev_clock[cpuid] = cpu_end_clock[cpuid] = clock

    if (cpu_start_clock[cpuid] == INIT_NUM):
        cpu_start_clock[cpuid] = clock
        continue
    if (pstate_prev == RUNNABLE and pstate_next == RUNNING):
        not_running_clock[cpuid] += lapsed_clock
        sum_not_running += lapsed_clock
        cnt_not_running += 1
    elif (pstate_prev == RUNNING):
        running_clock[cpuid] += lapsed_clock
        sum_running += lapsed_clock
        cnt_running += 1
        # print("pid: " + str(pid) + " lapsed clock " + str(lapsed_clock))

SIZE = 100
clock_start = [-1] * SIZE
clock_sum = [0] * SIZE
clock_total = 0
cpu_clock_sum = [0] * NCPU
idx = -1
start_point = [] # start points of line
sp_idx = [0] * 65 # index of start point

# draw line segment
# [0]: clock, [1]: cpu, [2]: pid, [3]: pstate_prev, [4]: pstate_next
for ep in df.itertuples(name=None, index=False):
    pid = ep[2]
    cpuid = ep[1]
    # skip blank data
    if (pid == 0):
        continue

    found_samepid = False

    for sp in start_point:
        if (sp[2] == pid):
            found_samepid = True

            if (sp[1] == ep[1] and sp[4] == 4 and ep[3] == 4):
                clock_sum[pid] += ep[0] - sp[0]
                cpu_clock_sum[cpuid] += ep[0] - sp[0]
                clock_total += ep[0] - sp[0]

            # update start_point
            start_point[sp_idx[pid]] = ep

    if (not found_samepid):
        start_point.append(ep)
        idx += 1
        sp_idx[pid] = idx

eval_indicators = ["time_turnaround", "cpu_usage", "runtime", "time_response", "balancing", "clock", "_environment", "counters"]

# make dictionary
summary = {}
for indicator_name in eval_indicators:
    list_tmp = []
    dict_tmp = {}

    if (indicator_name == "cpu_usage"):
        for i in range(NCPU):
            if running_clock[i] != 0:
                cpu = running_clock[i] / (cpu_end_clock[i] - cpu_start_clock[i]) * 100
                list_tmp.append(cpu)
                dict_tmp["_data_pid" + "{:0=2}".format(i)] = cpu

    elif (indicator_name == "time_turnaround"):
        for line in df_clock.itertuples(name=None, index=False):
            # skip unforked or unexited process
            if (line[3] == 0):
                continue;
            time = line[3] - line[1]
            list_tmp.append(time)
            dict_tmp["_data_pid" + "{:0=2}".format(int(line[0]))] = time

    elif (indicator_name == "runtime"):
        for i in range(NCPU):
            # if cpu_clock_sum[i] != 0:
            runtime_per_cpu = cpu_clock_sum[i] / sum(cpu_clock_sum) * 100
            list_tmp.append(runtime_per_cpu)
            dict_tmp["_data_pid" + "{:0=2}".format(i)] = runtime_per_cpu

    elif (indicator_name == "time_response"):
        for line in df_clock.itertuples(name=None, index=False):
            # skip unforked or unexited process
            if (line[3] == 0):
                continue;
            time = line[2] - line[1]
            list_tmp.append(time)
            dict_tmp["_data_pid" + "{:0=2}".format(int(line[0]))] = time

    elif (indicator_name == "balancing"):
        for i in range(SIZE):
            if (clock_sum[i] == 0):
                continue;
            runtime_per_process = clock_sum[i] / clock_total * 100
            list_tmp.append(runtime_per_process)
            dict_tmp["_data_pid" + "{:0=2}".format(i)] = runtime_per_process

    elif (indicator_name == "clock"):
        dict_tmp["running_size"] = cnt_running
        dict_tmp["running_average"] = float(sum_running / cnt_running)
        dict_tmp["idle_size"] = cnt_not_running
        dict_tmp["idle_average"] = float(sum_not_running / cnt_not_running)
        summary["clock"] = dict_tmp
        continue

    elif (indicator_name == "_environment"):
        dict_tmp["policy"] = policy
        dict_tmp["NCPU"] = NCPU
        dict_tmp["NPROC"] = NPROC
        dict_tmp["forknum"] = FORK_NUM
        dict_tmp["LOGSIZE"] = LOGSIZE
        dict_tmp["workload"] = workload
        dict_tmp["date"] = datetime.now().strftime("%Y/%m/%d %H:%M")
        summary["_environment"] = dict_tmp
        continue

    elif (indicator_name == "counters"):
        cnt_contextswitch = cnt_worksteal = 0
        for line in input_file.itertuples(name=None, index=False):
            if (line[0] == "cnt_worksteal"):
                cnt_worksteal = int(line[1])
            if (line[0] == "cnt_contextswitch"):
                cnt_contextswitch = int(line[1])
        dict_tmp["contextswitch"] = cnt_contextswitch
        dict_tmp["worksteal"] = cnt_worksteal
        summary["counters"] = dict_tmp
        continue

    else:
        print("invalid indicator name")
        exit(1)

    total = sum(list_tmp)
    size = len(list_tmp)
    mean = float(np.mean(list_tmp))
    std = float(np.std(list_tmp))

    dict_tmp["size"] = size
    dict_tmp["total"] = total
    dict_tmp["average"] = mean
    dict_tmp["standard"] = std
    dict_tmp["std/ave"] = std / mean * 100

    summary[indicator_name] = dict_tmp

# save data
os.makedirs(os.path.dirname(output_name), exist_ok=True)
shutil.copyfile(input_path, output_name + repeat_index + ".csv")
with open(output_name + repeat_index + ".yaml", 'w') as file:
    yaml.dump(summary, file)
    print("saved: " + output_name + repeat_index + ".yaml")
