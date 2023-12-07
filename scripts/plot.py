import numpy as np
import matplotlib.pyplot as plt
import yaml
import sys

args = sys.argv
if (len(args) != 6):
    print("usage: python3 scripts/plot.py WORKLOAD NCPU LOGSIZE FORK_NUM REPEAT_NUM")

nprocs = ['100', '5000', '15000']
policies = ['default', 'multiple']
workload = args[1]
ncpu = args[2]
logsize = args[3]
forknum = args[4]
repeatnum = args[5]

if (workload == "largewrite"):
    forknum = ''

x1 = [1, 2, 3]
x2 = [1.3, 2.3, 3.3]

category = ["time_turnaround", "cpu_usage", "runtime", "balancing", "counters", "time_response"]
# index = ["average", "average", "standard", "standard", "contextswitch"]
ytitle = ["turnaround time [clock]", "cpu usage [%]", "std of cpu time per cpu", \
          "std of cpu occupancy per process", "number of context switch", "response time [clock]"]

for i in range(len(category)):
    y = {}

    for policy in policies:
        values = []
        for nproc in nprocs:
            with open('log/' + workload + '/' + policy + '_cpu' + ncpu + '_nproc' + nproc + '_fork' + forknum + '_logsize' + logsize + '/' + 'summary.yaml') as file:
                obj = yaml.safe_load(file)
                values.append(obj[category[i]]["average"])
        y[policy] = values

    fig, ax = plt.subplots()
    ax.set_xlabel('size of ptable')
    ax.set_ylabel(ytitle[i])

    plt.bar(x1, y["default"], color='b', width=0.25, label='round robin', align="center")
    plt.bar(x2, y["multiple"], color='g', width=0.25, label='multiple runqueue', align="center")
    plt.legend(loc=2)

    plt.xticks([1.15, 2.15, 3.15], nprocs)
    plt.savefig("fig/" + workload + "/" + category[i] + ".png")
