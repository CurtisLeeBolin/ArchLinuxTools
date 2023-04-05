#!/bin/bash
# avtcupdate.sh

if [[ ! -f $(which git 2>/dev/null) ]]; then
  sudo pacman -Sy --noconfirm --needed git
fi

if [ -d ~/Projects/avtc/ ]; then
  python -m pip install ~/Projects/avtc/
else
  python -m pip install git+https://github.com/CurtisLeeBolin/avtc.git
fi
