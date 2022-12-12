#!/bin/bash

APP_DIR=~/Projects/nrdl

if [ ! -d "${APP_DIR}"/cpython ]; then
  mkdir -p "${APP_DIR}"
  cd "${APP_DIR}"
  python -m venv cpython
fi

#"${APP_DIR}"/cpython/bin/pip install --upgrade onlyfans-scraper

#"${APP_DIR}"/cpython/bin/pip install --upgrade git+https://github.com/taux1c/onlyfans-scraper

"${APP_DIR}"/cpython/bin/python -m pip install --upgrade cyberdrop-dl
