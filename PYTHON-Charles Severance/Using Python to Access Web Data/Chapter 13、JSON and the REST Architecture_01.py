import urllib.request, urllib.parse, urllib.error
import json

url = "http://py4e-data.dr-chuck.net/comments_268914.json"
data = urllib.request.urlopen(url).read()
jsonData = json.loads(data)

count = 0
for i in jsonData["comments"]:
    count += i['count']
print("Sum :", count)
