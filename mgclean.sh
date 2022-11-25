#!/bin/bash

for i in $(awk -F ' ' '{print $2}' mglog); do
  nrclean "${i}"
  sed -i '1d' mglog
done
