#!/bin/bash

errorFileArray=()

for i in *.mkv; do
  ffprobe -i "${i}" 2>null
  if [ $? -eq 1 ]; then
    errorFileArray+=("${i}")
  fi
done

if ! [ ${#errorFileArray[@]} -eq 0 ]; then
  echo 'Bad Files:'
  for (( i=0; i<${#errorFileArray[@]}; i++ )); do
    echo ${errorFileArray[${i}]}
  done
fi
