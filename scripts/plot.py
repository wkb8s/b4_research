import shutil
import numpy as np
import pandas as pd
from datetime import datetime
import matplotlib.pyplot as plt
import matplotlib.ticker as ticker
from matplotlib.collections import LineCollection

NPROC = 64
idx = -1
labels = [] # for legend
start_point = [] # start points of line
sp_idx = [0] * NPROC # index of start point
cnt_samecpu = [0] * NPROC # number of points in same CPU
logfile_path = 'log/log.csv'
colors = ['#ffffff', '#ffffff', '#ffffff', '#ff0000', \
          '#008000', '#0000ff', '#ffd700', '#ff69b4', \
          '#800080', '#808080', '#90ee90', '#8b4513', \
          '#e9967a', '#008080', '#ff00ff', '#556b2f', ]

fig, ax = plt.subplots()
dt = datetime.now()
exe_time = dt.strftime("%Y_%m%d_%H%M")

# import log
df = pd.read_csv(logfile_path, header=0)
shutil.copyfile(logfile_path, "log/" + exe_time + ".csv")

# use decimal and elapsed clock
df['clock'] = df['clock'].apply(lambda x: int(x, 16))
df['clock'] -= df['clock'][0]

# extract RUNNING infomation
df = df.query('pstate_prev == 4 or pstate_next == 4') \
    .loc[:,['clock', 'cpu', 'pid']] \
    .astype('int')

# draw line segment
for ep in df.itertuples(name=None, index=False):
    pid = ep[2]
    found_samepid = False
    for sp in start_point:
        if (sp[2] == pid):
            found_samepid = True

            # same cpu
            if (sp[1] == ep[1]):
                cnt_samecpu[pid] += 1
                if (cnt_samecpu[pid] % 2 == 0):
                    lc = LineCollection([[[sp[0], sp[1]], [ep[0], ep[1]]]], \
                                        colors=colors[pid], linewidth=10)
                    ax.add_collection(lc)
            # different cpu
            else:
                cnt_samecpu[pid] = 1

            start_point[sp_idx[pid]] = ep # update start_point

    if (not found_samepid):
        start_point.append(ep)
        idx += 1
        sp_idx[pid] = idx

    # draw invisible end point
    if (pid in labels):
        ax.scatter(ep[0], ep[1], c=colors[pid], s=100, alpha=0.0)
    else:
        ax.scatter(ep[0], ep[1], c=colors[pid], label=pid, s=100, alpha=0.0)
        labels.append(pid)

# let legend visible
leg = ax.legend(title="pid", title_fontsize=11)
for leha in leg.legend_handles:
    leha.set_alpha(1.0)

# use integer in y axis
plt.gca().get_yaxis().set_major_locator(ticker.MaxNLocator(integer=True))

plt.xlabel("elapsed clock", fontsize=11)
plt.ylabel("CPU number", fontsize=11)
plt.grid()
plt.savefig("fig/" + exe_time + ".png")
plt.show()
