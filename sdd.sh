#!/bin/bash
# sd
# Downloads a stream
# sd <link>


command_array_stream=(
  'streamlink'
  '--hls-live-restart'
  '--ffmpeg-start-at-zero'
  '--force'
  '--output' '{time:%Y%m%d%H%M%S} {author} - {title} [{id}].mp4'
  "${1}"
  'best'
)

command_array_clip=(
  'streamlink'
  '--hls-live-restart'
  '--ffmpeg-start-at-zero'
  '--force'
  '--output' '{author} - {title} [{id}].mp4'
  "${1}"
  'best'
)

get_stream () {
  if [[ ! "${1}" == *"/clip/"* ]]; then
    "${command_array_stream[@]}"
  else
    "${command_array_clip[@]}"
  fi
}

if [[ "${@}" =~ ( |\') ]]; then
  arr=(${@})
  for each in "${arr[@]}"; do
    get_stream ${each}
    max=60
    min=15
    sleep $(shuf -i $min-$max -n 1)
  done
else
  get_stream ${@}
fi
