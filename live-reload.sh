#!/usr/bin/env sh

# pdb won't be usable with entr,
# use https://pypi.org/project/remote-pdb/ instead

# no_embedded (resources) is used to speed up the compilation

while true; do
    find src harmonyqml.pro -type f |
    entr -cdnr sh -c \
        'qmake CONFIG+="dev no_embedded" && make && ./harmonyqml --debug'
    sleep 0.2
done
