#!/bin/bash
# nrdlupdate.sh

if ! which git; then
  sudo pacman -Sy git
fi

if ! [ -d ~/.local/share/python3-venv ]; then
  python3 -m venv ~/.local/share/python3-venv
  ~/.local/share/python3-venv/bin/python -m pip install --upgrade pip
fi

~/.local/share/python3-venv/bin/python -m pip install --upgrade cyberdrop-dl

rm ~/.local/bin/nrdl
ln -s ~/.local/share/python3-venv/bin/cyberdrop-dl ~/.local/bin/nrdl
