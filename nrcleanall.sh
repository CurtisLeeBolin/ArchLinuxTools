#!/bin/bash


for i in */; do
  if [ -d "${i}" ]; then
    nrclean "${i}"
  fi
done
