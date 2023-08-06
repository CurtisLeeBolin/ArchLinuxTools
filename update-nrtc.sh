#!/bin/bash
# update-nrtc.sh

if [[ ! -f $(which git 2>/dev/null) ]]; then
  sudo pacman -Sy --noconfirm --needed git
fi


if [ ! -d ~/.local/lib/nrtc/ ]; then
  python -m venv ~/.local/lib/nrtc
fi

~/.local/lib/nrtc/bin/python -m pip install --upgrade pip

if [ -d ~/Projects/avtc/ ]; then
  ~/.local/lib/nrtc/bin/python -m pip install ~/Projects/avtc/
else
  ~/.local/lib/nrtc/bin/python -m pip install git+https://github.com/CurtisLeeBolin/avtc.git
fi

if [ -d ~/Projects/nrtc/ ]; then
  ~/.local/lib/nrtc/bin/python -m pip install ~/Projects/nrtc/
else
  ~/.local/lib/nrtc/bin/python -m pip install git+https://github.com/CurtisLeeBolin/nrtc.git
fi

cp ~/.local/lib/nrtc/bin/nrtc ~/.local/bin/
