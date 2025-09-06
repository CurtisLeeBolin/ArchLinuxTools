#!/bin/bash

mkdir 0out_fps

for i in *.mp4; do
  ffmpeg -discard nokey -i "${i}" -r 30 -codec copy 0out_fps/"${i%.*}.mkv"
done
