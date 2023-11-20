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

echo "Oh My Zsh" >>$log_file
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$HOME/.oh-my-zsh/custom/themes/spaceship-prompt" --depth=1
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
echo "Oh My Zsh installed" >>$log_file

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
unzip -o JetBrainsMono.zip -d ~/.local/share/fonts
fc-cache -fv
if [[ -f "$ROOT_PATH"/JetBrainsMono.zip ]]; then
	echo "Jet Brains Mono installed installed" >>$:qlog_file
else
	echo "ERROR: Jet Brains mono failed to install" >>$log_file
fi
rm JetBrainsMono.zip

echo "Tmux" >>$log_file
sudo apt-get -y install tmux
if type -p tmux >/dev/null; then
	echo "Tmux installed" >>$:qlog_file
else
	echo "ERROR: Tmux failed to install" >>$log_file
fi

echo "TPM" >>$log_file
if [[ ! -d "$HOME"/.tmux/plugins/tpm ]]; then
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
if [[ -f "$HOME"/.tmux/plugins/tpm/tpm ]]; then
	echo "TPM installed" >>$:qlog_file
else
	echo "ERROR: TPM failed to install" >>$log_file
fi

# using dircolors.ansi-dark
curl https://raw.githubusercontent.com/seebi/dircolors-solarized/master/dircolors.ansi-dark --output ~/.dircolors
## set colors for LS_COLORS
eval 'dircolors ~/.dircolors'
