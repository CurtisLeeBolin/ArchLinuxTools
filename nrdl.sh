#!/bin/bash

if [ -z "$1" ]; then
  ~/.local/lib/nrdl/bin/cyberdrop-dl --config-file ~/.config/nrdl/settings.yaml
else
  if [ "${1}" == "-r" ]; then
    ~/.local/lib/nrdl/bin/cyberdrop-dl --retry-failed --config-file ~/.config/nrdl/settings.yaml
  else
    echo 'Error: Invalid Argument'
    exit 1
  fi
fi
