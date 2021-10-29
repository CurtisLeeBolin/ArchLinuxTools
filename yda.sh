#!/bin/bash
# yda
# Simplifies the use of yt-dlp to download audio from youtube
# yda "<link> <link> ..."

url=$@

download_video () {
  yt-dlp --format=bestaudio --add-metadata \
    --merge-output-format ogg --ignore-errors \
    --output "%(uploader)s - %(title)s (%(id)s).ogg" "$1"
}

if [[ "$url" =~ ( |\') ]]; then
  arr=($url)
  for each in "${arr[@]}"; do
    download_video $each
  done
else
  download_video $url
fi
