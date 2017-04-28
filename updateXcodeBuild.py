#!/usr/bin/python

import sys
import xml.etree.ElementTree as ET

xmlFile = sys.argv[1]
tree = ET.parse(xmlFile)
root = tree.getroot()

index = 0
i = 0
for key in root.iter('key'):
    if("CFBundleVersion" == key.text):
        index = i
    i = i + 1

i = 0
for string in root.iter('string'):
    if(i == index):
        new_build = (float(string.text) + 1.0)
        string.text = str(new_build)
    i = i + 1

tree.write(xmlFile)
