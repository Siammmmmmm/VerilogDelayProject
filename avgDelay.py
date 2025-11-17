import re
log_file = "out5000.txt"

#match:time, sub, x, y
line_re = re.compile(
    r"^\s*(\d+)\s+sub=(\d)\s+\|\s+x=([-\d]+)\s+\([^)]*\)\s+\|\s+y=([-\d]+)\s+\([^)]*\)"
)

def getDelays(filename):
    delays = []
    current_inputs = None #(sub, x, y)
    t_start = None
    t_last  = None

    with open(filename) as f:
        for line in f:
            m = line_re.match(line)
            if not m:
                continue

            t   = int(m.group(1))
            sub = int(m.group(2))
            x   = int(m.group(3))
            y   = int(m.group(4))
            inputs = (sub, x, y)

            if current_inputs is None:
                # first vector
                current_inputs = inputs
                t_start = t
                t_last  = t
                continue

            if inputs == current_inputs:
                # same test vector
                t_last = t
            else:
                # new vector so close previous one
                delay = t_last - t_start
                delays.append(delay)

                # start new block
                current_inputs = inputs
                t_start = t
                t_last  = t
    # close last
    if current_inputs is not None and t_start is not None and t_last is not None:
        delays.append(t_last - t_start)
    return delays

delays = getDelays(log_file)
print(f"Total tests: {len(delays)}")
if delays:
    avg = sum(delays) / len(delays)
    print(f"Average: {avg:.2f} ns")
    print(f"Min: {min(delays)} ns, Max: {max(delays)} ns")
