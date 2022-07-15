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
    a=$(ls -sh "${result}")
    echo -e "${a%%\ *}"
		ffmpeg -i "${result}" 2>&1 | grep --color=always "Stream #0:.*:\|Duration:*"
		echo -e "\n\n"
	fi
done
