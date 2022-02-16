!#/usr/bin/env sh

git clone --recurse-submodules https://github.com/romgrk/fzy-lua-native.git \
    && cd fzy-lua-native \
    && make \
    #&& cd .. \
    #&& rm -r
