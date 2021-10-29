#!/bin/bash

PYTHONPATH=${HOME}/Projects/yt-dlp/:${PYTHONPATH} python \
  ${HOME}/Projects/yt-dlp/yt_dlp "$@"
