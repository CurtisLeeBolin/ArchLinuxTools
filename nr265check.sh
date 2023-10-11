#!/bin/bash

check_for_265 () {
  file="$1"
  ffprobe -hide_banner -i "${file}" 2>&1 | grep 265 2>&1 1>/dev/null || echo "${file}"
}


find ./ -type f -iname *.mp4 -print0 | while IFS='' read -r -d $'\0' file; do
  check_for_265 "${file}"
done
