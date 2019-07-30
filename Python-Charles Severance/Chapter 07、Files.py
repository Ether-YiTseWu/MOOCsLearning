# 7.1
fname = input("Enter file name: ")
fh = open(fname)
for line in fh:
    line = line.strip()
    line = line.upper()
    print(line)
    
# 7.2
fname = input("Enter file name: ")
fh = open(fname)
Num = 0
count = 0

for line in fh:
    if not line.startswith("X-DSPAM-Confidence:") : 
        continue
    lineAns = line.strip()
    lineAns = lineAns[20:]
    lineAns = float(lineAns)
    #print(lineAns)
    Num = lineAns + Num
    count = count + 1
    
ans = Num / count
print("Average spam confidence:", ans)
    
