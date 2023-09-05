import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import matplotlib.ticker as ticker

# generate formatted csv file
df = pd.read_csv('log/log.csv')

df['clock'] = df['clock'].apply(lambda x: int(x, 16))

df.replace({'event_name': {0: 'allocproc', 1: 'wakeup', 2: 'giveupCPU', 3: 'fork', 4: 'tick', 5: 'exit', 6: 'wait', 7: 'sleep'}, 'pstate_prev': {0: 'UNUSED', 1: 'EMBRYO', 2: 'SLEEPING', 3: 'RUNNABLE', 4: 'RUNNING', 5: 'ZOMBIE'}, 'pstate_next': {0: 'UNUSED', 1: 'EMBRYO', 2: 'SLEEPING', 3: 'RUNNABLE', 4: 'RUNNING', 5: 'ZOMBIE'}}).query('pstate_prev == "RUNNING" or pstate_next == "RUNNING"').loc[:,['clock', 'cpu', 'pid',]].to_csv('log/log_formatted.csv', index=False, header=False)

# make graph
data_set = np.loadtxt(
    fname="log/log_formatted.csv",
    dtype="int",
    delimiter=",",
)

colors = np.random.random_sample((50, 3))

for data in data_set:
    plt.scatter(data[0], data[1], c=colors[data[2]])
    # plt.plot(data[0], data[1], c=colors[data[2]], '.')

# x axis without offset
# plt.gca().get_xaxis().get_major_formatter().set_useOffset(False)
# use integer in y axis
plt.gca().get_yaxis().set_major_locator(ticker.MaxNLocator(integer=True))

# plt.title("Core State")
plt.xlabel("clock", fontsize=11)
plt.ylabel("CPU number", fontsize=11)
# plt.legend()
plt.grid()

plt.show()
