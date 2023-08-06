#!/bin/bash
# update-mtc.sh

if [[ ! -f $(which git 2>/dev/null) ]]; then
  sudo pacman -Sy --noconfirm --needed git
fi


if [ ! -d ~/.local/lib/mtc/ ]; then
  python -m venv ~/.local/lib/mtc
fi

~/.local/lib/mtc/bin/python -m pip install --upgrade pip

if [ -d ~/Projects/avtc/ ]; then
  ~/.local/lib/mtc/bin/python -m pip install ~/Projects/avtc/
else
  ~/.local/lib/mtc/bin/python -m pip install git+https://github.com/CurtisLeeBolin/avtc.git
fi

if [ -d ~/Projects/mtc/ ]; then
  ~/.local/lib/mtc/bin/python -m pip install ~/Projects/mtc/
else
  ~/.local/lib/mtc/bin/python -m pip install git+https://github.com/CurtisLeeBolin/mtc.git
fi

cp ~/.local/lib/mtc/bin/mtc ~/.local/bin/
