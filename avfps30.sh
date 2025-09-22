#!/bin/bash

if [ ! -d '0out' ]; then
  mkdir 0out
fi

for i in *.mp4; do
  ffmpeg -discard nokey -i "${i}" -r 30 -codec copy -y 0out/"${i%.*}.mkv"
  if [ $? -eq 0 ]; then
    rm "${i}"
  fi
done
