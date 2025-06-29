#!/usr/bin/env bash

ORIGINAL_DIR="${HOME}/.tmp/nr/model/"

mapfile -t image_dir_array < <(find . -mindepth 1 -maxdepth 1 -type d -printf '%P\n')

for i in "${image_dir_array[@]}"; do
  du -sh "${ORIGINAL_DIR}${i}"
  du -sh "${i}"
  #echo "${i}"
  read -p 'Keep Original, New, or Merge? (o/n/m): ' answer
  if [[ "${answer}" == 'o' ]]; then
    rm -r "${i}"
  elif [[ "${answer}" == 'n' ]]; then
    rm -r "${ORIGINAL_DIR}""${i}"
    mv "${i}" "${ORIGINAL_DIR}""${i}"
  elif [[ "${answer}" == 'm' ]]; then
    mv "${i}" "${ORIGINAL_DIR}${i}/${i}$(date +'%s%N')"/
    nrclean "${ORIGINAL_DIR}""${i}"
  else
    echo Bad Selection!
  fi
  echo
done
