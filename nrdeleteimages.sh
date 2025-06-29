#!/usr/bin/env bash


mapfile -t image_dir_array < <(find . -type d -name images)

#mapfile -t image_dir_array < <(find . -mindepth 1 -maxdepth 1 -type d -printf '%f\n')

for i in "${image_dir_array[@]}"; do
  echo "${i} $(ls -1 ${i} | wc -l)"
  read -p 'Delete? (y/n): ' answer
  if [[ "${answer}" == 'y' ]]; then
    rm -r "${i}"
  fi
  echo
done
