"""Wrapper Lib around the psutil library
designed for more practical usage"""

import psutil
# takes list, returns index of lowest val in list
min_index = lambda x:x.index(min(x))

def kill_all_but_earliest(pid_dict):
    """ takes dictionary of pid's, kills each except the one created earliest"""
    start_times = list()
    for iter in range(len(pid_dict)):
        start_times.append(pid_dict[str(iter)].create_time())
    pid_dict.pop(str(min_index(start_times)))
    # skips the step if pid_dict is empty
    if pid_dict:
        for pid in pid_dict:
            pid_dict[pid].kill()

def kill_all_by_name(target_proc):
    """kills all processes which contain target_proc in their
    name, case insensitive"""
    resultdict = get_proc_dict(target_proc)
    for pid in resultdict:
        resultdict[pid].kill()

        
def kill_all_but_earliest_process_by_name(target_proc):
    """ kills all processes which contain target_proc in their name, except
    the earliest one called, case the target_proc is used in case insenstive search"""
    resultdict = get_proc_dict(target_proc)
    kill_all_but_earliest(resultdict)

def get_proc_dict(target_proc):
    """takes target_proc returns dict with proc objects
    is case insensitive"""
    resultdict = dict()
    for proc in psutil.process_iter(attrs=['pid', 'name']):
        if (target_proc.lower() in proc.name().lower()): 
            resultdict[str(len(resultdict))] = proc

    return resultdict

                
            