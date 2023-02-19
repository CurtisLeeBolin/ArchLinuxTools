#!/bin/bash
# ydupdate.sh

if [[ ! -f $(which git 2>/dev/null) ]]; then
  sudo pacman -Sy git
fi

if [ ! -d ~/.local/share/python3-venv/ ]; then
  python3 -m venv ~/.local/share/python3-venv/
  ~/.local/share/python3-venv/bin/python -m pip install --upgrade pip
fi

~/.local/share/python3-venv/bin/python -m pip install 'git+https://github.com/yt-dlp/yt-dlp.git'

rm ~/.local/bin/yt-dlp
ln -s ~/.local/share/python3-venv/bin/yt-dlp ~/.local/bin/yt-dlp
