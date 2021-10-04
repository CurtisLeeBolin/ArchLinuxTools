#!/bin/bash
# ydp
# Downloads all videos of a channel/user/playlist with numbering
# ydp "<link> <link> ..."

url=$@

config_dir="${HOME}/.config/youtube-dl"
random_string=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 13)
tmp_dir="/tmp/ydn-${random_string}"

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
    --output "%(autonumber)s %(uploader)s - %(title)s (%(id)s).%(ext)s" "$1"
}

download_video $url

rm -r "${tmp_dir}"
