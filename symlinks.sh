#!/bin/zsh

ROOT_PATH=$(
	cd "$(dirname "${BASH_SOURCE[0]}")"
	pwd -P
)
log_file="$ROOT_PATH"/progress.log

sudo rm -rf $HOME/.config/nvim > /dev/null 2>&1

ln -sf $ROOT_PATH/.config/nvim ~/.config/nvim
