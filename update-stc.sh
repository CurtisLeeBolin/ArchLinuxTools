#!/bin/bash
# update-stc.sh

if [[ ! -f $(which git 2>/dev/null) ]]; then
  sudo pacman -Sy --noconfirm --needed git
fi


if [ ! -d ~/.local/lib/stc/ ]; then
  python -m venv ~/.local/lib/stc
fi

~/.local/lib/stc/bin/python -m pip install --upgrade pip

if [ -d ~/Projects/avtc/ ]; then
  ~/.local/lib/stc/bin/python -m pip install ~/Projects/avtc/
else
  ~/.local/lib/stc/bin/python -m pip install git+https://github.com/CurtisLeeBolin/avtc.git
fi

if [ -d ~/Projects/stc/ ]; then
  ~/.local/lib/stc/bin/python -m pip install ~/Projects/stc/
else
  ~/.local/lib/stc/bin/python -m pip install git+https://github.com/CurtisLeeBolin/stc.git
fi

cp ~/.local/lib/stc/bin/stc ~/.local/bin/
