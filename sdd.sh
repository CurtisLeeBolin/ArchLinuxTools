#!/bin/bash
# sd
# Downloads a stream
# sd <link>


command_array=(
  'streamlink'
  '--hls-live-restart'
  '--ffmpeg-start-at-zero'
  '--output'
  '{time:%Y%m%d%H%M%S} {author} - {title} [{id}].mp4'
  "${1}"
  'best'
)

"${command_array[@]}"
