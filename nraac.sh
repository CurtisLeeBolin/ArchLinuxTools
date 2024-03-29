#!/bin/bash

extArray=( mp4 )

inDir='0in'
outDir='0out'

dirArray=( "${inDir}" "${outDir}" )

for i in "${dirArray[@]}"; do
  if [ ! -d "${i}" ]; then
    mkdir "${i}"
  fi
done

for i in *; do
    ext="${i##*.}"
    extLower="${ext@L}"
  if [ -f "${i}" ] && [[ ! " ${array[*]} " =~ " ${extLower} " ]]; then
    filename="${i%.*}"
    mv "${i}" "${inDir}"/"${i}"
    ffmpeg \
      -i "${inDir}"/"${i}" \
      -c:v copy \
      -c:a aac \
      -movflags +faststart \
      -map_metadata -1 \
      -y \
      -f mp4 \
      "${outDir}"/"${filename}".part
    if [ $? == 0 ]; then
      mv "${outDir}"/"${filename}".part "${outDir}"/"${filename}".mp4
    else
      mv "${outDir}"/"${filename}".part "${outDir}"/"${filename}".error
    fi
  fi
done
