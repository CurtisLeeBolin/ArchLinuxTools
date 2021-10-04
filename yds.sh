#!/bin/bash
# yds
# Downloads from a youtube search
# yds <number> <search term>
#
# examples to download 10 Harlem Shake Videos:
#
# yds 10 Harlem\ Shake
# or
# yds 10 "Harlem Shake"


count="$1"
shift
search_term=$@

config_dir="${HOME}/.config/youtube-dl"
random_string=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 13)
tmp_dir="/tmp/yds-${random_string}"

if [ ! -f ${config_dir}/cookies.txt ]; then
  echo "File ${config_dir}/cookies.txt not found."
  exit 1
fi

mkdir "${tmp_dir}"
cp "${config_dir}"/cookies.txt "${tmp_dir}"/cookies.txt

download_video () {
  youtube-dl --embed-subs --add-metadata \
    --cookies "${tmp_dir}"/cookies.txt \
    --merge-output-format mkv --ignore-errors --sub-lang en \
    --output "%(uploader)s - %(title)s (%(id)s).%(ext)s" "ytsearch$count:$search_term"
}

download_video $search_term

rm -r "${tmp_dir}"
