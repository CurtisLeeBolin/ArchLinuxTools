#!/bin/bash
# ydupdate.sh

if ! which git; then
  sudo pacman -Sy git
fi

if ! [ -d ~/Projects ]; then
  mkdir ~/Projects
fi

cd ~/Projects

if [ -d yt-dlp ]; then
  cd yt-dlp
  git pull
else
  git clone https://github.com/yt-dlp/yt-dlp.git
fi
