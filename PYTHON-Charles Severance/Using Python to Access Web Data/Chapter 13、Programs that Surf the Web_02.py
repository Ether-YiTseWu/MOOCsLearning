# -*- coding: utf-8 -*-
"""
Created on Wed Jan 22 12:46:28 2020

@author: user
"""

import urllib.request, urllib.parse, urllib.error
from bs4 import BeautifulSoup

for i in range(7):
    r = urllib.request.urlopen('http://py4e-data.dr-chuck.net/known_by_Fikret.html')
htmlSoup = BeautifulSoup(r)

nameList = list()
for i in htmlSoup('a'):
    print(i.text)