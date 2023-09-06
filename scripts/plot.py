import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from matplotlib.collections import LineCollection
import matplotlib.ticker as ticker

# generate formatted csv file
df = pd.read_csv('log/log.csv')

# use relative clock
df['clock'] = df['clock'].apply(lambda x: int(x, 16))
df['clock'] = df['clock'] - df['clock'][0]

df.query('pstate_prev == 3 or pstate_next == 3').loc[:,['clock', 'cpu', 'pid']].to_csv('log/log_formatted.csv', index=False, header=False)

# draw graph
data_set = np.loadtxt(
    fname="log/log_formatted.csv",
    dtype="int",
    delimiter=",",
)

fig, ax = plt.subplots()
# colors = np.random.random_sample((100, 3))
colors = ["r", "r", "r", "r", "b", "g", "y", "m", "c", "k", "w"]
labels = [] # for legend
start_point = [] # store points pair
sp_idx = [0] * 64
idx = -1

for data in data_set:
    flag = True
    for sp in start_point:
        # same pid
        if (sp[2] == data[2]):
            flag = False

            # draw line when same cpu
            if (sp[1] == data[1]):
                lc = LineCollection([[[sp[0], sp[1]], [data[0], data[1]]]], colors=colors[data[2]], linewidth=3)
                ax.add_collection(lc)

            start_point[sp_idx[data[2]]] = data

    # same pid is not found
    if (flag):
        start_point.append(data)
        idx += 1
        sp_idx[data[2]] = idx

    # draw points
    if (data[2] in labels):
        ax.scatter(data[0], data[1], c=colors[data[2]])
    else:
        ax.scatter(data[0], data[1], c=colors[data[2]], label=data[2])
        labels.append(data[2])

# use integer in y axis
plt.gca().get_yaxis().set_major_locator(ticker.MaxNLocator(integer=True))

# plt.title("Core State")
plt.xlabel("elapsed clock", fontsize=11)
plt.ylabel("CPU number", fontsize=11)
plt.legend(title="pid", fontsize=11)
plt.grid()
plt.show()
