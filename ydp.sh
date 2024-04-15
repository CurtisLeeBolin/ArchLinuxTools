#!/bin/bash
# ydp
# Downloads all videos of a playlist with index
# ydp <link> <link> ...

url="$@"

download_video () {
	yt-dlp \
  --sub-langs en,id,-live_chat \
  --embed-subs \
  --embed-metadata \
  --output "%(playlist_index)s %(uploader)s - %(title)s [%(id)s].%(ext)s"  \
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
