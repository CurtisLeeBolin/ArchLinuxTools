#!/bin/bash
# update-streamlink.sh

if [[ ! -f $(which git 2>/dev/null) ]]; then
  sudo pacman -Sy --noconfirm --needed git
fi

if [ ! -d ~/.local/lib/streamlink/ ]; then
  python -m venv ~/.local/lib/streamlink
fi

~/.local/lib/streamlink/bin/python -m pip install --upgrade pip

~/.local/lib/streamlink/bin/python -m pip install git+https://github.com/streamlink/streamlink.git

cp ~/.local/lib/streamlink/bin/streamlink ~/.local/bin/
