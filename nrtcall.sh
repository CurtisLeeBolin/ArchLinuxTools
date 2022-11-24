#!/bin/bash

for i in *; do
  if [ -d "${i}" ]; then
    cd "${i}"
    nrtc
    cd ..
  fi
done
