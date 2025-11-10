#!/bin/bash
# update-mg.sh

if [ ! -d ~/.local/lib/mg/ ]; then
  python -m venv ~/.local/lib/mg
fi

~/.local/lib/mg/bin/python -m pip install --upgrade pip

if [ -d ~/Projects/mg/ ]; then
  ~/.local/lib/mg/bin/python -m pip install ~/Projects/mg/
else
  ~/.local/lib/mg/bin/python -m pip install git+https://github.com/CurtisLeeBolin/mg.git
fi

cp ~/.local/lib/mg/bin/mg ~/.local/bin/
