#!/bin/bash


for i in */; do
  if [ -d "${i}" ]; then
    nrclean "${i::-1}"
  fi
done
