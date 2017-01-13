#!/bin/bash

mkdir ~/hugo && cd "$_"
curl -Lk https://github.com/spf13/hugo/releases/download/v0.17/hugo_0.17_Linux-64bit.tar.gz | tar xz
mv hugo*/hugo* ~/hugo017 && chmod +x "$_"
exit 0
