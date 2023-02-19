#!/bin/bash
# ydupdate.sh

if ! which git; then
  sudo pacman -Sy git
fi

if ! [ -d ~/.local/share/python3-venv ]; then
  python3 -m venv ~/.local/share/python3-venv
  ~/.local/share/python3-venv/bin/python -m pip install --upgrade pip
fi

cd /tmp/
git clone --depth=1 https://github.com/yt-dlp/yt-dlp.git
~/.local/share/python3-venv/bin/python -m pip install yt-dlp/
rm -rf yt-dlp/

rm ~/.local/bin/yt-dlp
ln -s ~/.local/share/python3-venv/bin/yt-dlp ~/.local/bin/yt-dlp
