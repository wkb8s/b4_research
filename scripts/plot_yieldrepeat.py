import numpy as np
import matplotlib.pyplot as plt
import yaml

nprocs = ['100', '5000', '15000']
policies = ['default', 'multiple']

x1 = [1, 2, 3]
x2 = [1.3, 2.3, 3.3]

category = ["time_turnaround", "cpu_usage", "balancing"]
index = ["average", "average", "standard"]

for i in range(len(category)):
    y = {}

    for policy in policies:
        values = []
        for nproc in nprocs:
            with open('log/yieldrepeat/' + policy + '_cpu8_nproc' + nproc + '_fork32_logsize500.yaml') as file:
                obj = yaml.safe_load(file)
                values.append(obj[category[i]][index[i]])
        y[policy] = values

    fig, ax = plt.subplots()
    ax.set_xlabel('size of ptable')
    ax.set_ylabel(category[i])

    plt.bar(x1, y["default"], color='b', width=0.25, label='round robin', align="center")
    plt.bar(x2, y["multiple"], color='g', width=0.25, label='multiple runqueue', align="center")
    plt.legend(loc=2)

    plt.xticks([1.15, 2.15, 3.15], nprocs)
    plt.savefig("fig/yieldrepeat/" + category[i] + ".png")
