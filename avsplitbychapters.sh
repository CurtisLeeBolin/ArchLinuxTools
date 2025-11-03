#!/bin/bash
# Use this to split by chapter.
# Once you know last chapter of each
# episode, run the following:
# $ mkvmerge -o fileOut.mkv --split chapters:1,2,3 0in/fileIn.mkv

if [ -n "${1}" ]; then
  mkvmerge -o "${1%.*}"_."${1##*.}" --split chapters:all "${1}"
else
  echo 'Error: no file given'
  exit 1
fi
