#!/bin/bash
# nrtcupdate.sh

if [[ ! -f $(which git 2>/dev/null) ]]; then
  sudo pacman -Sy git
fi

python -m pip install git+https://github.com/actionless/pikaur.git
