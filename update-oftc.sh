#!/bin/bash
# oftcupdate.sh

if [[ ! -f $(which git 2>/dev/null) ]]; then
  sudo pacman -Sy git
fi

#if [ ! -d ~/.local/share/python3-venv/ ]; then
#  python3 -m venv ~/.local/share/python3-venv/
#  ~/.local/share/python3-venv/bin/python -m pip install --upgrade pip
#fi

#if [ ! -d ~/Projects/oftc/ ]; then
#  [ ! -d ~/Projects/ ] &&  mkdir ~/Projects/
#  cd ~/Projects
#  git clone --depth=1 https://github.com/CurtisLeeBolin/oftc.git
#fi

#cd ~/Projects/
python -m pip install ~/Projects/oftc/

#rm ~/.local/bin/oftc
#ln -s ~/.local/share/python3-venv/bin/oftc ~/.local/bin/oftc
