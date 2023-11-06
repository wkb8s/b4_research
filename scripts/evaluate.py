import pandas as pd
import numpy as np
import math
import shutil
import subprocess

# NPROC must be < 100
NCPU = NPROC = PROC_MAX = LOGSIZE = proc_cnt = 0
policy = ''
workload = ''
input_path = 'log/tmp.log'
logfile_path = 'log/log.csv'
logclock_path = 'log/clock.csv'

# split inputfile to csv
input_file = pd.read_csv(input_path)
for line in input_file.itertuples(name=None, index=False):
    if (len(line[0]) == 16):
        LOGSIZE += 1
        if (int(line[6]) > NCPU):
            NCPU = int(line[6])
    if (len(line[0]) <= 2):
        NPROC += 1
    if (line[0] == "NPROC"):
        PROC_MAX = line[1]
    if (line[0] == "policy"):
        policy = line[1]
    if (line[0] == "workload"):
        workload = line[1]
NCPU += 1

input_file.iloc[:LOGSIZE:].to_csv(logfile_path, index=False)
input_file.iloc[LOGSIZE:LOGSIZE + NPROC + 1:] \
    .to_csv(logclock_path, header=False, index=False)
df = pd.read_csv(logfile_path, header=0)
df_clock = pd.read_csv(logclock_path, header=0)

# use decimal and elapsed clock
df['clock'] = df['clock'].apply(lambda x: int(x, 16))
df['clock'] -= df['clock'][0]
df_clock['fork'] = df_clock['fork'].apply(lambda x: int(x, 16))
df_clock['run'] = df_clock['run'].apply(lambda x: int(x, 16))
df_clock['exit'] = df_clock['exit'].apply(lambda x: int(x, 16))

# extract RUNNING infomation
df = df.query('pstate_prev == 4 or pstate_next == 4') \
    .loc[:,['clock', 'cpu', 'pid', 'pstate_prev', 'pstate_next']] \
    .astype('int')

# get CPU usage
start_clock = [-1] * NCPU
cnt_running = cnt_not_running = sum_running = sum_not_running = 0
running_clock = [0] * NCPU
not_running_clock = [0] * NCPU
for line in df.itertuples(name=None, index=False):
    clock = line[0]
    cpuid = line[1]
    if (line[3] == 3 and line[4] == 4 and start_clock[cpuid] != -1):
        not_running_clock[cpuid] += clock - start_clock[cpuid]
        sum_not_running += clock - start_clock[cpuid]
        cnt_not_running += 1
    elif (line[3] == 4 and line[4] == 3 and start_clock[cpuid] != -1):
        running_clock[cpuid] += clock - start_clock[cpuid]
        sum_running += clock - start_clock[cpuid]
        cnt_running += 1
    start_clock[cpuid] = clock

# calculate response time and turn around time
response = []
turnaround = []
for line in df_clock.itertuples(name=None, index=False):
    # skip unforked or unexited process
    if (line[3] == 0):
        continue;
    response.append(line[2] - line[1])
    turnaround.append(line[3] - line[1])
    proc_cnt += 1

# calculate balancing
clock_start = [0] * NPROC
clock_sum = [0] * NPROC
clock_total = 0
# [0]: clock, [1]: cpu, [2]: pid, [3]: pstate_prev, [4]: pstate_next
for ep in df.itertuples(name=None, index=False):
    pid = ep[2]
    # skip blank data
    if (pid == 0):
        continue

    if (ep[4] == 4):
        clock_start[pid] = ep[0]

    if (ep[3] == 4):
        if (clock_start[pid] == 0):
            continue
        clock_sum[pid] += ep[0] - clock_start[pid]
        clock_total += ep[0] - clock_start[pid]

print("\n- environment")
print("policy     : %s" %(policy))
print("NCPU       : %s" %(NCPU))
print("NPROC      : %s" %(PROC_MAX))
print("fork num   : %d" %(proc_cnt - 1))
print("LOGSIZE    : %d\n" %(LOGSIZE))
print("workload    : %s\n" %(workload))
# copy log
shutil.copyfile(input_path, "log/" + policy + "_" + workload \
                + "_cpu" + str(NCPU) + "_nproc" + str(PROC_MAX) + "_fork" \
                + str(proc_cnt - 1) + "_logsize" + str(LOGSIZE) + ".csv")

print("- balancing")
balance_rate = []
for i in range(NPROC):
    if (clock_sum[i] == 0):
        continue;
    balance_rate.append(clock_sum[i] / clock_total * 100)
    # print("pid %d : %f" %(i, balance_rate[i]))
print("ave: %f" %(np.mean(balance_rate)))
print("std: %f" %(np.std(balance_rate)))
print("std/ave: %f percent" %(np.std(balance_rate) / np.mean(balance_rate) * 100))
print("total: %f\n" %(sum(balance_rate)))

print("- response")
print("ave   : %d" %(np.mean(response)))
print("std   : %d" %(np.std(response)))
print("std/ave : %f percent\n" %(np.std(response) / np.mean(response) * 100))

print("- turnaround")
print("sum : %d" %(np.sum(turnaround)))
print("ave : %d" %(np.mean(turnaround)))
print("std : %d" %(np.std(turnaround)))
print("std/ave : %f percent\n" %(np.std(turnaround) / np.mean(turnaround) * 100))

print("- clock")
print("running_ave     : %d" \
      %(sum_running / cnt_running))
print("not_running_ave : %d\n" \
      %(sum_not_running / cnt_not_running))

print("- cpu usage")
ave_cpu = 100 * sum_running / (sum_running + sum_not_running)
std_cpu = 0
print("ave : %9f percent" %(ave_cpu))
for i in range(NCPU):
    if running_clock[i] != 0:
        diff_cpu = 100 * running_clock[i] / (running_clock[i] + not_running_clock[i])
        std_cpu += (ave_cpu - diff_cpu) ** 2
std_cpu /= NCPU
std_cpu = math.sqrt(std_cpu)
print("std : %9f percent" %(std_cpu))
print("std/ave : %9f percent" %(std_cpu / ave_cpu * 100))
for i in range(NCPU):
    if running_clock[i] != 0:
        print("cpu %d usage : %9f percent" \
          %(i, 100 * running_clock[i] / (running_clock[i] + not_running_clock[i])))
