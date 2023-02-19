#!/bin/bash
# avtcupdate.sh

if [[ ! -f $(which git 2>/dev/null) ]]; then
  sudo pacman -Sy git
fi

if [ ! -d ~/.local/share/python3-venv/ ]; then
  python3 -m venv ~/.local/share/python3-venv/
  ~/.local/share/python3-venv/bin/python -m pip install --upgrade pip
fi

if [ ! -d ~/Projects/avtc/ ]; then
  [ ! -d ~/Projects/ ] &&  mkdir ~/Projects/
  cd ~/Projects
  git clone --depth=1 https://github.com/CurtisLeeBolin/avtc.git
fi

cd ~/Projects/
~/.local/share/python3-venv/bin/python -m pip install avtc/

rm ~/.local/bin/avtc
ln -s ~/.local/share/python3-venv/bin/avtc ~/.local/bin/avtc
