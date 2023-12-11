import os
import sys
import yaml
import statistics

def calculate_stats(data_list):
    # When datasize is 1, standard deviation is set to 0
    if len(data_list) == 1:
        return data_list[0], 0, 1
    mean = sum(data_list) / len(data_list)
    stdev = statistics.stdev(data_list)
    total_count = len(data_list)
    return mean, stdev, total_count

def process_yaml_file(file_path, field, subfield):
    with open(file_path, 'r') as file:
        yaml_data = yaml.safe_load(file)

    field_data = yaml_data.get(field, {}).get(subfield, None)
    if field_data is None:
        return None

    # Use float() if stored as a small number
    return float(field_data)

def main():
    args = sys.argv
    if (len(args) != 9):
        print("usage: python3 scripts/summarize.py WORKLOAD POLICY NCPU NPROC FORK_NUM LOGSIZE REPEAT_NUM")
        exit(1)
    workload = args[1]
    policy = args[2]
    ncpu = args[3]
    nproc = args[4]
    forknum = args[5]
    logsize = args[6]
    repeatnum = args[7]
    workload_index = args[8]

    # largewrite
    if (workload_index == "1"):
        forknum = ''

    log_directory = "log/" + workload + "/" + policy + '_cpu' + ncpu + '_nproc' + nproc + '_fork' + forknum + '_logsize' + logsize
    output_file = log_directory + "/" + 'summary.yaml'

    fields = [
        {'name': 'time_turnaround', 'subfield': 'average'},
        {'name': 'cpu_usage', 'subfield': 'average'},
        {'name': 'runtime', 'subfield': 'standard'},
        {'name': 'balancing', 'subfield': 'standard'},
        {'name': 'counters', 'subfield': 'contextswitch'},
        {'name': 'time_response', 'subfield': 'average'}
    ]

    summary_data = {}

    for field_info in fields:
        field = field_info['name']
        subfield = field_info['subfield']
        values = []

        for i in range(int(repeatnum)):
            file_path = log_directory + "/" + str(i + 1) + ".yaml"
            value = process_yaml_file(file_path, field, subfield)
            if value is not None:
                values.append(value)

        mean, stdev, total_count = calculate_stats(values)

        summary_data[field] = {
            'average': mean,
            'std': stdev,
            # 'std/ave': stdev / mean * 100,
            'size': total_count
        }

    with open(output_file, 'w') as output_file:
        yaml.dump(summary_data, output_file)

    print(f"Summary file created: {output_file}")

if __name__ == "__main__":
    main()
