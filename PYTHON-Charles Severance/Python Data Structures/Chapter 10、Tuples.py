# 10.2
#=======================================================================
name = input("Enter file:")
if len(name) < 1 : name = "mbox-short.txt"
handle = open(name)

count = dict()
hourLst = list()

for line in handle:
    if not line.startswith('From '): continue
    words = line.split()
    temp = words[5]
    hour = temp.split(':')
    hour = hour[0]
    hourLst.append(hour)

for hour in hourLst:
    count[hour] = count.get(hour,0) + 1
count = sorted(count.items())

for hour,num in count:
    print(hour,num)
