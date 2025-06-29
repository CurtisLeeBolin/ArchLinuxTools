#!/bin/bash
# ydd
# Downloads all videos of a channel/user/playlist or list of videos with date
# ydd <link> <link> ...

command_array=(
  'yt-dlp'
  '--sub-lang' 'en,id,-live_chat'
  '--embed-subs'
  '--embed-metadata'
  '--output' "%(upload_date)s %(uploader)s - %(title)s [%(id)s].%(ext)s"
)

if [ -f cookies.txt ]; then
  command_array+=('--cookies' 'cookies.txt')
fi

if [[ "$1" == '-l' ]]; then
  command_array+=('--format' 'bv[height<=1080]+ba/b[height<=1080]')
  shift
  url="$@"
else
  url="$@"
fi

if [[ "$url" =~ ( |\') ]]; then
  arr=(${url})
  for each in "${arr[@]}"; do
    "${command_array[@]}" ${each}
  done
else
  "${command_array[@]}" ${url}
fi
