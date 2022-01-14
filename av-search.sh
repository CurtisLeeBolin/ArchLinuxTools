#!/bin/bash

query="$@"

fileTypeArray=(mkv mp4 avi)

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
