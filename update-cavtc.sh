#!/bin/bash
# update-cavtc.sh

if [[ ! -f $(which git 2>/dev/null) ]]; then
  sudo pacman -Sy --noconfirm --needed git
fi

if [ ! -d ~/.local/lib/cavtc/ ]; then
  python -m venv ~/.local/lib/cavtc
fi

~/.local/lib/cavtc/bin/python -m pip install --upgrade pip

if [ -d ~/Projects/cavtc/ ]; then
  ~/.local/lib/cavtc/bin/python -m pip install ~/Projects/cavtc/
else
  ~/.local/lib/cavtc/bin/python -m pip install git+https://github.com/CurtisLeeBolin/cavtc.git
fi

cp ~/.local/lib/cavtc/bin/cavtc ~/.local/bin/
