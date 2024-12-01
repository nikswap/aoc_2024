import sys

FILENAME=sys.argv[1]

l1 = []
l2 = []
with open(FILENAME) as fin:
    for line in fin:
        line = line.strip().split()
        l1.append(int(line[0]))
        l2.append(int(line[-1]))

l1 = sorted(l1)
l2 = sorted(l2)
print('Part 1 solution:')
print(sum([abs(x-y) for x,y in zip(l1,l2)]))

print('Part 2 solution')
print(sum(i*l2.count(i) for i in l1))
