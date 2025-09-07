#!/bin/bash
# gdl.sh

command_array=(
  "gallery-dl"
  '--retries' '-1'
  '--sleep' '2.3-15.7'
  '--user-agent' 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'
)

if [ -f cookies.txt ]; then
  command_array+=('--cookies' 'cookies.txt')
fi

if [[ "$1" == '--images' ]]; then
  shift
else
  command_array+=('--filter' 'extension in ("webm", "ogg", "mp4", "m4v", "m4v", "mov")')
fi

"${command_array[@]}" ${@}
