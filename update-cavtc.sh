#!/bin/bash
# update-cavtc.sh

if [[ ! -f $(which git 2>/dev/null) ]]; then
  sudo pacman -Sy --noconfirm --needed git
fi

if [ ! -d ~/.local/lib/cavtc/ ]; then
  python -m venv ~/.local/lib/cavtc
fi

~/.local/lib/cavtc/bin/python -m pip install --upgrade pip

if [ -d ~/Projects/avtc/ ]; then
  ~/.local/lib/cavtc/bin/python -m pip install ~/Projects/avtc/
else
  ~/.local/lib/cavtc/bin/python -m pip install git+https://github.com/CurtisLeeBolin/avtc.git
fi

if [ -d ~/Projects/cluster_avtc/ ]; then
  ~/.local/lib/cavtc/bin/python -m pip install ~/Projects/cluster_avtc/
else
  ~/.local/lib/cavtc/bin/python -m pip install git+https://github.com/CurtisLeeBolin/cluster_avtc.git
fi

cp ~/.local/lib/cavtc/bin/cavtc ~/.local/bin/
