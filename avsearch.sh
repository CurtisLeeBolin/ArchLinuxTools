#!/bin/bash

fileTypeArray=(avi flv mov mp4 mpeg mpg ogg ogm ogv wmv m2ts mkv rmvb rm 3gp m4a 3g2 mj2 asf divx vob webm)


print_help () {
  echo "avsearch - search for directories and files, giving info about video files"
  echo
  echo "avsearch [OPTION] [blob search term]"
  echo
  echo "'-h, --help' Prints this help."
  echo "'-c, --concise' No extra info about video files and no directories."
}


search () {
  init_run=true
  for ext in "${fileTypeArray[@]}"; do
    if ${init_run}; then
      find_ext="-iname *.${ext}"
    else
      find_ext="${find_ext} -o -iname *.${ext}"
    fi
    init_run=false
  done
  find "${HOME}"/{Videos,.tmp/saved}/ -type f -iname "${query}*" -a \( ${find_ext} \) -printf '%f\n' | sort
}


search_verbose () {
  resultArray=()
  mapfile -d '' resultArray < <(find "${HOME}"/{Videos,.tmp/saved}/ -iname "${query}*" -print0 2>/dev/null)

  for result in "${resultArray[@]}"; do
    echo "${result}"
    fileType="${result##*.}"
    fileType="${fileType,,}" #lowercase
    if [[ " ${fileTypeArray[@]} " =~ " ${fileType} " ]]; then
      fileDataArray=($(ls -lh --full-time "${result}"))
      #echo "${fileDataArray[5]} ${fileDataArray[6]%.*}"
      echo "${fileDataArray[4]} ${fileDataArray[5]} ${fileDataArray[6]%.*}"
      #echo "${fileDataArray[4]}"
      ffprobe "${result}" 2>&1 | grep "Stream #0:.*:\|Duration:*" | sed 's/^[ ][ ]//'
    fi
    echo -e '\n'
  done
}


error_message () {
  echo "Not Enough Arguments Given!"
  echo
  print_help
  exit 1
}


if [ "${1}" == "-h" ] || [ "${1}" == "--help" ]; then
  print_help
  exit 0
elif [ "${1}" == "-c" ]; then
  if [ -n "${1}" ] || [ -n "${2}" ]; then
    shift
    query="${@}"
    search
  else
    error_message
  fi
else
  if [ -n "${1}" ]; then
    query="${@}"
    search_verbose
  else
    error_message
  fi
fi
