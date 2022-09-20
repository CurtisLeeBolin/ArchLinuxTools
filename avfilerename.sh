#!/bin/bash

d=2
if [ "${1}" == "-h" ]; then
  echo "'-h help' Prints this help."
  echo "'-n n' Sets the number of digits."
  exit 0
fi
if [ "${1}" == "-n" ]; then
  shift
  d="${1}"
  shift
fi

i=${2}
for f in *; do
	if [ -f "${f}" ]; then
		mv -i -- "${f}" "$(printf "%s%0${d}d%s" "${1}" "${i}" "${3}")"
		let i=i+1
	fi
done
