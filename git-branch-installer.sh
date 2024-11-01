#!/bin/bash

set -e

uninstall() {
    local file="$1"
    local common="[[:space:]]\+sterzik\/git-branch\([[:space:]]\|$\)"
    local start="^[[:space:]]*###>$common"
    local end="\n[[:space:]]*###<$common"
    
    test -f "$file" && sed -i "/$start/{:a;N;/$end/!ba;d}" -- "$file"
}

install() {
    local file="$1"
    local source="$2"
    local source_escaped="'`echo -n "$source" | sed "s/'/'\\\\\\''/g"`'"
    test -f "$file" && sed -i '${/^[[:space:]]*$/d}' "$file"
    echo -e '\n###> sterzik/git-branch (do not edit lines below manually) ###\ntest -f '"$source_escaped"' && source '"$source_escaped"'\n###< sterzik/git-branch (do not edit lines above manually) ###' >> "$file"
}


curl -s -S -o ~/.git-branch https://raw.githubusercontent.com/marek-sterzik/git-branch/refs/heads/main/git-branch.sh

if [ ! -f ~/.bashrc ]; then
    touch ~/.bashrc
fi
uninstall ~/.bashrc
install ~/.bashrc "~/.git-branch"

echo "git-branch script successfully installed"
