#!/bin/bash

query="$@"

fileTypeArray=(avi flv mov mp4 mpeg mpg ogg ogm ogv wmv m2ts mkv rmvb rm 3gp m4a 3g2 mj2 asf divx vob webm)

resultArray=()
mapfile -d '' resultArray < <(find $HOME/{Videos,.tmp/saved}/ -iname "${query}*" -print0 2>/dev/null)

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
