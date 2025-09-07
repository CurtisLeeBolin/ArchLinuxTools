#!/bin/bash
# update-gallery-dl.sh

app='gallery-dl'

if [[ ! -f $(which git 2>/dev/null) ]]; then
  sudo pacman -Sy --noconfirm --needed git
fi

if [ -d ~/.local/lib/"${app}"/ ]; then
  rm -r ~/.local/lib/"${app}"
fi

python -m venv ~/.local/lib/"${app}"

~/.local/lib/"${app}"/bin/python -m pip install --upgrade pip

~/.local/lib/"${app}"/bin/python -m pip install git+https://github.com/mikf/"${app}".git

cp ~/.local/lib/"${app}"/bin/"${app}" ~/.local/bin/
