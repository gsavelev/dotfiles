#!/bin/bash
apt-get update
git submodule update --init --recursive

# zsh
apt-get install zsh -y
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
cp -p $HOME/dotfiles/.zshrc $HOME/.zshrc

#vim
apt-get install vim -y
mkdir $HOME/.vim/
cp -rp $HOME/dotfiles/.vim/* $HOME/.vim/
cp -rp $HOME/dotfiles/.vimrc $HOME/.vimrc

#utils
mkdir $HOME/bin/utils
cp -rp $HOME/dotfiles/utils/* $HOME/bin/utils

zsh
