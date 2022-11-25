#!/bin/bash

function move {
  file="${1##*/}"
  if [ ! -f "${2}/${file}" ]; then
    mv "${1}" "${2}"/
  else
    index=$(date +"%s%N")
    filename="${file%.*}"
    fileext="${1##*.}"
    mv "${1}" "${2}/${filename}_${index}.${fileext}"
  fi
}

function clean {
  if [ ! -d images ]; then
    mkdir images
  fi
  pwd
  find ./* -not -path './images/*' -type f -iregex '.*\(jpg\|jpeg\|png\|gif\|webp\)' | \
    while read file; do
      move "$file" images;
    done
  find ./* -mindepth 1 -type f -iregex '.*\(mkv\|mp4\|m4v\|mov\|avi\|wmv\|webm\)' | \
    while read file; do
      move "$file" .;
    done
  find ./* -type f -not -iregex '.*\(jpg\|jpeg\|png\|gif\|webp\|mkv\|mp4\|m4v\|mov\|avi\|wmv\|webm\|info\)' -exec rm {} \;
  find ./* -type d -not -name 'images' -exec rm -r {} \;
  fdupes -rdN ./
  rmdir --ignore-fail-on-non-empty images
}

if [ ! -z "$1" ]; then
  if [ -d "$1" ]; then
    cd "$1"
    clean
    cd ..
  else
    echo "\'$1\' does not exist."
    exit
  fi
else
  clean
fi
