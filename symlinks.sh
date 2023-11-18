#!/bin/zsh

ROOT_PATH=$(
	cd "$(dirname "${BASH_SOURCE[0]}")"
	pwd -P
)
log_file="$ROOT_PATH"/progress.log

sudo rm -rf $HOME/.config/nvim > /dev/null 2>&1
sudo rm -rf $HOME/.config/tmux > /dev/null 2>&1
sudo rm -rf $HOME/.local/bin/scripts/tmux-sessionizer > /dev/null 2>&1

ln -sf $ROOT_PATH/.config/nvim ~/.config/nvim
ln -sf $ROOT_PATH/.config/tmux ~/.config/tmux

tmux_session_path=$HOME/.local/bin/scripts

ls "$tmux_session_path" 
if [ -d "$tmux_session_path" ]; then 
  rm -Rf "$tmux_session_path"
fi
mkdir -p "$tmux_session_path"
ln -sf $ROOT_PATH/.local/bin/scripts/tmux-sessionizer "$tmux_session_path"/tmux-sessionizer

