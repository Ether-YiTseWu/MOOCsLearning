# 9.4
#=======================================================================
name = input("Enter file:")
if len(name) < 1 : name = "mbox-short.txt"
handle = open(name)
count = dict()

for line in handle:
    if not line.startswith('From') : continue
    if line.startswith('From:') : continue
    words = line.split()
    mailWord = words[1]
    count[mailWord] = count.get(mailWord,0) + 1

biggestWord = ''
biggestCount = 0
for key in count:
    if count[key] > biggestCount:
        biggestCount = count[key]
        biggestWord = key

print(biggestWord,biggestCount)
