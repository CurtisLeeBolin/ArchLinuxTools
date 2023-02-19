#!/bin/bash

query="$@"

find $HOME/.tmp/nr/ -type d -iname "*${query}*"

find $HOME/.tmp/nr/ -type f -name info -exec bash -c "if grep ${query} {} >/dev/null; then echo -e '{}'; fi" \;
