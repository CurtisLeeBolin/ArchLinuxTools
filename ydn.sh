#!/bin/bash
# ydp
# Downloads all videos of a channel/user/playlist with numbering
# ydp "<link> <link> ..."

url=$@

download_video () {
  yt-dlp --embed-subs --add-metadata \
    --merge-output-format mkv --ignore-errors --sub-lang en \
    --output "%(autonumber)s %(uploader)s - %(title)s (%(id)s).%(ext)s" "$1"
}

download_video $url
