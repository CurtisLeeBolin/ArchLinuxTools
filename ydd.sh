#!/bin/bash
# ydd
# Downloads all videos of a channel/user/playlist or list of videos with date
# ydd "<link> <link> ..."

url=$@

download_video () {
	while true; do
 		yt-dlp \
      --sub-langs "en,id,-live_chat" --write-subs --write-auto-subs \
      --embed-subs --compat-options no-keep-subs --convert-subs ass \
      --add-metadata \
    	--merge-output-format mkv --ignore-errors --sub-lang en \
      ${2} \
    	--output "%(upload_date)s %(uploader)s - %(title)s (%(id)s).%(ext)s" "$1"
		if [[ $? -eq 0 ]]; then
      break
    fi
	done
}

cookies=""
if [ -f cookies.txt ]; then
  cookies="--cookies cookies.txt"
fi

if [[ "$url" =~ ( |\') ]]; then
  arr=(${url})
  for each in "${arr[@]}"; do
    download_video ${each} "${cookies}"
  done
else
  download_video ${url} "${cookies}"
fi
