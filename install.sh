#!/bin/bash

VERSION="0.10.1"

ROOT_PATH=$(cd "$(dirname "${BASH_SOURCE[0]}")"; pwd -P)
OPT=$ROOT_PATH"/.opt"
NVIM_BIN=$OPT"/nvim"
SRC_EXPORT='export PATH="$PATH:'"$NVIM_BIN"'/nvim-linux64/bin"'

if [ -d "$OPT" ]; then
    echo "Found $OPT directory."
else
    echo "Creating $OPT."
    mkdir -p $OPT
fi

if [ -d "$NVIM_BIN" ]; then
    rm -rf "$NVIM_BIN"/*
    echo "Contents of $NVIM_BIN have been deleted."
else
    echo "Directory $NVIM_BIN does not exist. Creating it."
    mkdir -p $NVIM_BIN
fi

cd $NVIM_BIN

curl -LO https://github.com/neovim/neovim/releases/download/v$VERSION/nvim-linux64.tar.gz
tar -xzvf nvim-linux64.tar.gz

append_if_not_exists() {
    local file="$1"
    if [ -f "$file" ]; then
        if ! grep -Fxq "$SRC_EXPORT" "$file"; then
            echo "$SRC_EXPORT" >> "$file"
            echo "Appended to $file"
        else
            echo "Line already exists in $file"
        fi
	source $file
    fi
}

# Check and append to ~/.bashrc if necessary
append_if_not_exists "$HOME/.bashrc"

# Check and append to ~/.zshrc if necessary
append_if_not_exists "$HOME/.zshrc"

cd $ROOT_PATH
