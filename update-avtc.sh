#!/bin/bash
# update-avtc.sh

if [[ ! -f $(which git 2>/dev/null) ]]; then
  sudo pacman -Sy --noconfirm --needed git
fi


if [ ! -d ~/.local/lib/avtc/ ]; then
  python -m venv ~/.local/lib/avtc
fi

~/.local/lib/avtc/bin/python -m pip install --upgrade pip

if [ -d ~/Projects/avtc/ ]; then
  ~/.local/lib/avtc/bin/python -m pip install ~/Projects/avtc/
else
  ~/.local/lib/avtc/bin/python -m pip install git+https://github.com/CurtisLeeBolin/avtc.git
fi

cp ~/.local/lib/avtc/bin/avtc ~/.local/bin/
