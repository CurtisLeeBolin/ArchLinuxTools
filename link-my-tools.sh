#!/bin/bash

cwd="$(pwd)"

for i in *.{py,sh}; do
  if [ "${i}" != 'link-my-tools.sh' ]; then
    j="${i##*/}"
    j="${j%.??}"

    if [ -L ~/.local/bin/"${j}" ]; then
      rm ~/.local/bin/"${j}"
    fi

    ln -s "${cwd}/${i}" ~/.local/bin/"${j}"
  fi
done
