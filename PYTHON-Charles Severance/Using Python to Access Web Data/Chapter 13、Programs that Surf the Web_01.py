# -*- coding: utf-8 -*-
"""
Created on Wed Jan 22 12:24:57 2020

@author: user
"""
import urllib.request, urllib.parse, urllib.error
from bs4 import BeautifulSoup

r = urllib.request.urlopen("http://py4e-data.dr-chuck.net/comments_268911.html").read()
htmlSoup = BeautifulSoup(r, 'html.parser')

count = 0
for i in htmlSoup('span'):
    count += int(i.text)
print(count)