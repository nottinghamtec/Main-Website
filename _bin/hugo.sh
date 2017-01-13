#!/bin/bash

mkdir ~/hugo && cd "$_"
curl -Lk https://github.com/spf13/hugo/releases/download/v0.18.1/hugo_0.18.1_Linux-64bit.tar.gz | tar xz
mv hugo*/hugo* ~/hugo018 && chmod +x "$_"
exit 0
