#!/usr/bin/env bash

curl -O https://raw.githubusercontent.com/clojure-lsp/clojure-lsp/master/install
chmod a+x install
sudo ./install --version nightly --dir ~/.local/bin
rm install
