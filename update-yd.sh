#!/bin/bash
# update-yd.sh

if [[ ! -f $(which git 2>/dev/null) ]]; then
  sudo pacman -Sy --noconfirm --needed git
fi

if [ ! -d ~/.local/lib/yt-dlp/ ]; then
  python -m venv ~/.local/lib/yt-dlp
fi

~/.local/lib/yt-dlp/bin/python -m pip install --upgrade pip

if [ -d ~/Projects/yt-dlp/ ]; then
  ~/.local/lib/yt-dlp/bin/python -m pip install ~/Projects/yt-dlp/
else
  ~/.local/lib/yt-dlp/bin/python -m pip install git+https://github.com/yt-dlp/yt-dlp.git
  ~/.local/lib/yt-dlp/bin/python -m pip install curl-cffi
fi

cp ~/.local/lib/yt-dlp/bin/yt-dlp ~/.local/bin/
