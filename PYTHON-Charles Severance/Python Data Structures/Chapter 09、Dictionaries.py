# 8.4
#=======================================================================
fname = input("Enter file name: ")
fh = open(fname)
lst = list()
for line in fh:
    words = line.rstrip()
    words = words.split()
    for word in words:
        if word in lst: continue
        lst.append(word)

lst.sort()
print(lst)

# 8.5
#=======================================================================
fname = input("Enter file name: ")
if len(fname) < 1 : fname = "mbox-short.txt"

fh = open(fname)
count = 0

for line in fh:
    line = line.rstrip()
    if not line.startswith('From') : continue
    if line.startswith('From:') : continue
    words = line.split()
    print(words[1])
    count = count + 1
    
print("There were", count, "lines in the file with From as the first word")
