#!/bin/bash

mkdir ~/hugo && cd "$_"
curl -Lk https://github.com/gohugoio/hugo/releases/download/v0.73.0/hugo_0.73.0_Linux-64bit.tar.gz | tar xz
mv hugo ~/hugo073 && chmod +x "$_"
exit 0
