import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from matplotlib.collections import LineCollection
import matplotlib.ticker as ticker

# generate formatted csv file
df = pd.read_csv('log/log.csv')

# use decimal relative clock
df['clock'] = df['clock'].apply(lambda x: int(x, 16))
df['clock'] = df['clock'] - df['clock'][0]

# filter unnecessary info
# extract RUNNING info
df.query('pstate_prev == 4 or pstate_next == 4') \
    .loc[:,['clock', 'cpu', 'pid']] \
    .to_csv('log/log_formatted.csv', index=False, header=False)

# draw graph
data_set = np.loadtxt(
    fname="log/log_formatted.csv",
    dtype="int",
    delimiter=",",
)

fig, ax = plt.subplots()
# colors = np.random.random_sample((100, 3))
colors = ['#ffffff', '#ffffff', '#ffffff', '#ff0000', \
          '#008000', '#0000ff', '#ffd700', '#ff69b4', \
          '#800080', '#808080', '#90ee90', '#8b4513', \
          '#e9967a', '#008080', '#ff00ff', '#556b2f', ]
labels = [] # for legend
start_point = [] # start points of line
sp_idx = [0] * 64 # index of start point
cnt_samecpu = [0] * 64 # number of points in same CPU
idx = -1

# seek end point of line
for ep in data_set: # ep : end_point
    pid = ep[2]
    flag = True
    for sp in start_point:
        # same pid
        if (sp[2] == pid):
            flag = False

            # same cpu
            if (sp[1] == ep[1]):
                cnt_samecpu[pid] += 1
                # draw line
                if (cnt_samecpu[pid] % 2 == 0):
                    lc = LineCollection([[[sp[0], sp[1]], [ep[0], ep[1]]]], \
                                        colors=colors[pid], linewidth=10)
                    ax.add_collection(lc)
            # different cpu
            else:
                cnt_samecpu[pid] = 1

            start_point[sp_idx[pid]] = ep # update start_point

    # same pid is not found in 'start_point'
    if (flag):
        start_point.append(ep)
        idx += 1
        sp_idx[pid] = idx

    # draw points
    if (pid in labels):
        ax.scatter(ep[0], ep[1], c=colors[pid], s=100, marker="|")
    else:
        ax.scatter(ep[0], ep[1], c=colors[pid], label=pid, s=100, marker="|")
        labels.append(pid)

plt.gca().get_yaxis().set_major_locator(ticker.MaxNLocator(integer=True)) # use integer in y axis
plt.xlabel("elapsed clock", fontsize=11)
plt.ylabel("CPU number", fontsize=11)
plt.legend(title="pid", fontsize=11)
plt.grid()
plt.show()
