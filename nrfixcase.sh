#!/bin/bash

for i in *; do
  mv "${i}" "$(sed 's/\b\(.\)/\u\1/g' <<<"${i}")"
done
