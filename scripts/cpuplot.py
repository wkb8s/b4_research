import os
import sys
import shutil
import subprocess
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import matplotlib.ticker as ticker
from matplotlib.collections import LineCollection

args = sys.argv
if (len(args) != 8):
    print("usage: python3 scripts/cpuplot.py NCPU NPROC POLICY LOGSIZE WORKLOAD FORK_NUM CALC_NUM")
    exit(1)

ncpu = args[1]
nproc = args[2]
policy = args[3]
logsize = args[4]
workload = args[5]
forknum = args[6]
calcnum = args[7]

savepath = 'fig/' + workload + '/' + policy + '_cpu' + ncpu + '_nproc' + nproc + '_fork' + forknum + '_logsize' + logsize + '/'
os.makedirs(savepath, exist_ok=True)

NPROC = 100
idx = -1
labels = [] # for legend
start_point = [] # start points of line
sp_idx = [0] * NPROC # index of start point
fig, ax = plt.subplots()
logfile_path = 'log/log.csv'
colors = ['#CD5C5C', '#FFA07A', '#FF0000', '#FFC0CB', \
          '#FF1493', '#FF7F50', '#FF4500', '#FFFF00', \
          '#FFDAB9', '#BDB76B', '#D8BFD8', '#BA55D3', \
          '#8B008B', '#483D8B', '#ADFF2F', '#3CB371', \
          '#008000', '#66CDAA', '#00FFFF', '#4682B4', \
          '#00008B', '#FFF8DC', '#DEB887', '#F4A460', \
          '#DAA520', '#D2691E', '#A52A2A', '#FFE4E1', \
          '#808080', '#745399', '#233B6C', '#B1063A']

# import log
df = pd.read_csv(logfile_path, header=0)

# use decimal and elapsed clock
df['clock'] = df['clock'].apply(lambda x: int(x, 16))
df = df.sort_values('clock')
df['clock'] -= df['clock'].min()

# extract RUNNING infomation
df = df.query('pstate_prev == 4 or pstate_next == 4') \
    .loc[:,['clock', 'cpu', 'pid', 'pstate_prev', 'pstate_next']] \
    .astype('int')

# draw line segment
# [0]: clock, [1]: cpu, [2]: pid, [3]: pstate_prev, [4]: pstate_next
for ep in df.itertuples(name=None, index=False):
    pid = ep[2]
    # skip blank data
    if (pid == 0):
        continue

    found_samepid = False

    for sp in start_point:
        if (sp[2] == pid):
            found_samepid = True
            if (sp[1] == ep[1] and sp[4] == 4 and ep[3] == 4):
                # draw line
                lc = LineCollection([[[sp[0], sp[1]], [ep[0], ep[1]]]], colors=colors[pid % len(colors)], linewidth=30)
                ax.add_collection(lc)
            # update start_point
            start_point[sp_idx[pid]] = ep

    if (not found_samepid):
        start_point.append(ep)
        idx += 1
        sp_idx[pid] = idx

    # draw invisible end point
    if (pid in labels):
        ax.scatter(ep[0], ep[1], c=colors[pid % len(colors)], s=100, alpha=0.0)
    else:
        ax.scatter(ep[0], ep[1], c=colors[pid % len(colors)], label=pid, s=100, alpha=0.0)
        labels.append(pid)

# let legend visible
leg = ax.legend(title="pid", loc='center left', bbox_to_anchor=(1., .5), ncols=2)
for leha in leg.legend_handles:
    leha.set_alpha(1.0)

    # for debugging
    # if (pid in labels):
    #     ax.scatter(ep[0], ep[1], c=colors[pid % len(colors)])
    # else:
    #     ax.scatter(ep[0], ep[1], c=colors[pid % len(colors)], label=pid)
    #     labels.append(pid)

# use integer in y axis
plt.gca() \
    .get_yaxis() \
    .set_major_locator(ticker.MaxNLocator(integer=True))

plt.xlabel("elapsed clock", fontsize=11)
plt.ylabel("CPU number", fontsize=11)
plt.grid()
# plt.xlim(0,1.4e7)
plt.show()
plt.savefig(savepath + "cpuplot.png", bbox_inches="tight")
