# -*- coding: utf-8 -*-
"""
Created on Mon Jan 13 16:01:40 2020

@author: Administrator
"""
import re

data = open('regex_sum_268909.txt')
intList = []

for line in data:
   strList = re.findall('[0-9]+', line)
   if strList:
       for strNum in strList:
           intList.append(int(strNum))

count = 0
for number in intList:
    count += number
print(count)