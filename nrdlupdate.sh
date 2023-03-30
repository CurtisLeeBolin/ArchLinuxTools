#!/bin/bash
# nrdlupdate.sh

if [[ ! -f $(which git 2>/dev/null) ]]; then
  sudo pacman -Sy git
fi

#if [ ! -d ~/.local/share/python3-venv/ ]; then
#  python3 -m venv ~/.local/share/python3-venv/
#  ~/.local/share/python3-venv/bin/python -m pip install --upgrade pip
#fi

#~/.local/share/python3-venv/bin/python -m pip install --upgrade cyberdrop-dl
python -m pip install 'git+https://github.com/Jules-WinnfieldX/CyberDropDownloader'

rm ~/.local/bin/nrdl
ln -s $(which cyberdrop-dl) ~/.local/bin/nrdl
