#! /bin/bash

ROOT_PATH=$(
	cd "$(dirname "${BASH_SOURCE[0]}")"
	pwd -P
)
log_file="$ROOT_PATH"/progress.log

echo $log_file

sudo apt update
sudo apt-get -y install unzip
sudo apt-get -y install fontconfig
sudo apt-get -y install libfuse2

sudo apt-get -y install zsh
echo "ZSH" >>$log_file
if type -p zsh >/dev/null; then
	echo "zsh installed" >>$log_file
else
	echo "ERROR: zsh failed to install" >>$log_file
fi

echo "Neovim" >>$log_file
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
mv nvim.appimage $HOME/
sudo ln -s $HOME/nvim.appimage /usr/bin/nvim
if type -p nvim >/dev/null; then
	echo "Neovim installed" >>$log_file
else
	echo "ERROR: neovim failed to install" >>$log_file
fi

echo "Git" >>$log_file
sudo apt-get -y install git
if type -p git >/dev/null; then
	echo "Git installed" >>$log_file
else
	echo "ERROR: Git failed to install" >>$log_file
fi

echo "Jet Brains Mono" >>$log_file
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip
unzip -o JetBrainsMono.zip -d ~/.fonts
fc-cache -fv
rm JetBrainsMono.zip
if [[ -f "$ROOT_PATH"/JetBrainsMono.zip ]]; then
	echo "Jet Brains Mono installed installed" >>$:qlog_file
else
	echo "ERROR: Jet Brains mono failed to install" >>$log_file
fi

echo "Tmux" >>$log_file
sudo apt-get -y install tmux
if [[ -f "$ROOT_PATH"/JetBrainsMono.zip ]]; then
	echo "Tmux installed installed" >>$:qlog_file
else
	echo "ERROR: Tmux failed to install" >>$log_file
fi
