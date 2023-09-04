import pandas as pd

df = pd.read_csv('log/log.csv')

df['clock'] = df['clock'].apply(lambda x: int(x, 16))

print(df.replace({' event name': {0: 'allocproc', 1: 'wakeup', 2: 'giveupCPU', 3: 'fork', 4: 'tick', 5: 'exit', 6: 'wait', 7: 'sleep'}, ' prev pstate': {0: 'UNUSED', 1: 'EMBRYO', 2: 'SLEEPING', 3: 'RUNNABLE', 4: 'RUNNING', 5: 'ZOMBIE'}, ' next pstate': {0: 'UNUSED', 1: 'EMBRYO', 2: 'SLEEPING', 3: 'RUNNABLE', 4: 'RUNNING', 5: 'ZOMBIE'}}).to_string(index=False))
