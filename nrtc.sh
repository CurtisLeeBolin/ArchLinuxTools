#!/bin/bash

extArray=( 3pg asf avi flv mkv mov mp4 mpeg mpg m4a m4v rmvb ts wmv )

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
  if [ -f "${i}" ] && [[ " ${extArray[@]} " =~ " ${extLower} " ]]; then
    filename="${i%.*}"
    mv "${i}" "${inDir}"/"${i}"
    ffmpeg \
      -i "${inDir}"/"${i}" \
      -filter:v "scale=w='max(1920,iw)':h='min(1080,ih)':force_original_aspect_ratio=decrease:force_divisible_by=8" \
      -c:v libx265 \
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
