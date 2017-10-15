#!/bin/bash

mkdir ~/hugo && cd "$_"
curl -Lk https://github.com/spf13/hugo/releases/download/v0.29/hugo_0.29_Linux-64bit.tar.gz | tar xz
mv hugo ~/hugo029 && chmod +x "$_"
exit 0
