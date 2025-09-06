#!/bin/bash
# update-yt-dlp.sh

app='yt-dlp'

if [[ ! -f $(which git 2>/dev/null) ]]; then
  sudo pacman -Sy --noconfirm --needed git
fi

if [ -d ~/.local/lib/"${app}"/ ]; then
  rm -r ~/.local/lib/"${app}"
fi

python -m venv ~/.local/lib/"${app}"

~/.local/lib/"${app}"/bin/python -m pip install --upgrade pip

#~/.local/lib/yt-dlp/bin/python -m pip install git+https://github.com/"${app}"/"${app}".git
~/.local/lib/"${app}"/bin/python -m pip install "${app}"[default,curl-cffi,secretstorage]

cp ~/.local/lib/"${app}"/bin/"${app}" ~/.local/bin/
