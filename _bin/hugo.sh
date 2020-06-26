#!/bin/bash

mkdir ~/hugo && cd "$_"
curl -Lk https://github.com/spf13/hugo/releases/download/v0.73/hugo_0.73_Linux-64bit.tar.gz | tar xz
mv hugo ~/hugo073 && chmod +x "$_"
exit 0
