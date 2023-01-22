#!/bin/bash

query="$@"

find $HOME/{.nwa,.tmp/{nr,saved}}/ -iname "*${query}*"

find $HOME/{.nwa,.tmp/{nr,saved}}/ -type f -name info -exec bash -c "if grep ${query} {} >/dev/null; then echo -e '{}'; fi" \;
