#!/bin/bash

if [ ! -d "${1}" ]; then
  mkdir "${1}"
else
  touch "${1}"
fi

echo "mgdl ${1} '${2}'" >> mglog

#mega-get -qm --ignore-quota-warn "${2}" "${1}"
mega-get -qm "${2}" "${1}"
