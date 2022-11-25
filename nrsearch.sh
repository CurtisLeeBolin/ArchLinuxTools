#!/bin/bash

query="$@"

find $HOME/{.nwa,.tmp/{nr,saved}}/ -iname "${query}*"
