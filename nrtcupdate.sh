#!/bin/bash
# nrtcupdate.sh

if [[ ! -f $(which git 2>/dev/null) ]]; then
  sudo pacman -Sy git
fi

if [ ! -d ~/.local/share/python3-venv/ ]; then
  python3 -m venv ~/.local/share/python3-venv/
  ~/.local/share/python3-venv/bin/python -m pip install --upgrade pip
fi

#if [ ! -d ~/Projects/nrtc/ ]; then
#  [ ! -d ~/Projects/ ] &&  mkdir ~/Projects/
#  cd ~/Projects
#  git clone --depth=1 https://github.com/CurtisLeeBolin/nrtc.git
#fi

cd ~/Projects/
~/.local/share/python3-venv/bin/python -m pip install nrtc/

rm ~/.local/bin/nrtc
ln -s ~/.local/share/python3-venv/bin/nrtc ~/.local/bin/nrtc
