#!/bin/bash
# ydupdate.sh

if [[ ! -f $(which git 2>/dev/null) ]]; then
  sudo pacman -Sy git
fi

python -m pip install 'git+https://github.com/yt-dlp/yt-dlp.git'
