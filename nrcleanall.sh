#!/bin/bash


for i in $(ls -d -- */); do
  if [ -d "${i}" ]; then
    nrclean "${i}"
  fi
done
