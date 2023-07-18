#!/bin/bash

text=''

for i in $(awk -F ' ' '{print $2}' mglog); do
  text+="$(du -sh "${i}")\n"
done

echo -e ${text} | uniq | sort -h
