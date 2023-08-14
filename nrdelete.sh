#!/bin/bash

IFS=$'\n'
for line in $(ls -1d *); do
  ls -d 0out/"${line}" 2>/dev/null 1>&2
  if [ $? -eq 0 ]; then
    if [[ "$1" == '-d' ]]; then
      du -sh "${line}" 0out/"${line}"
      read -p "Are you sure? " -n 1 -r
      if [[ $REPLY =~ ^[Yy]$ ]]; then
        rm -r 0out/"${line}"
      fi
      echo
    else
      du -sh "${line}" 0out/"${line}"
    fi
  fi
done
