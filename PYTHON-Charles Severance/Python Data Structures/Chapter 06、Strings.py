# 6.5
#=======================================================================
text = "X-DSPAM-Confidence:    0.8475";
index = text.find('0')
print(float(text[index:index+6]))
