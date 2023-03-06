#!/bin/bash

errorFileArray=()

for i in *; do
  if [ -f "${i}" ]; then
    ffprobe -i ./"${i}" 2>/dev/null
    if [ $? -eq 1 ]; then
      errorFileArray+=("${i}")
    fi
  fi
done

if ! [ ${#errorFileArray[@]} -eq 0 ]; then
  echo 'Bad Files:'
  for (( i=0; i<${#errorFileArray[@]}; i++ )); do
    echo ${errorFileArray[${i}]}
  done
fi
