#!/bin/bash
# yd
# Downloads all videos of a channel/user/playlist or list of videos
# yd <link> <link> ...

url="$@"

#download_video () {
#	while true; do
# 		yt-dlp \
#      --sub-langs en,id,-live_chat \
#      --embed-subs \
#      --embed-metadata \
#      $2 \
#    	$1
#		if [[ $? -eq 0 ]]; then
#      break
#    fi
#	done
#}

download_video () {
	yt-dlp \
  --sub-langs en,id,-live_chat \
  --embed-subs \
  --embed-metadata \
  --live-from-start \
  --output "%(uploader)s - %(title)s [%(id)s].%(ext)s"  \
  $2 \
  $1
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
