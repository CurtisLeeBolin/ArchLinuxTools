#!/bin/bash

file=${1}

ffmpeg -i "${file}" 2>&1 | grep -P --color=always "DATE.*?:|Duration:*|Stream #0:.*?:"
