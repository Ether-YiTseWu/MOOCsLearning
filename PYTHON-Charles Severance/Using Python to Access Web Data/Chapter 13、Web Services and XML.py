# -*- coding: utf-8 -*-
"""
Created on Mon Jan 27 13:28:04 2020

@author: user
"""
import urllib.request, urllib.parse, urllib.error
import xml.etree.ElementTree as ET

url = "http://py4e-data.dr-chuck.net/comments_268913.xml"
data = urllib.request.urlopen(url).read()   # data type is "bytes"
print('Retrieved', len(data), 'characters')
#print(data.decode())

tree = ET.fromstring(data)
commentTree = tree.findall('comments/comment')
countSum = 0
count = 0
for i in commentTree:
    countSum += int(i.find("count").text)
    count += 1
print("Sum is", countSum)
print("Count is", count)