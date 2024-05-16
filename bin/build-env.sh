#!/bin/bash
apt-get update

# zsh
apt-get install zsh -y
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
cp -p $HOME/dotfiles/.zshrc $HOME/.zshrc
zsh

#vim
apt-get install zsh -y
mkdir $HOME/.vim/
cp -rp $HOME/dotfiles/.vim/* $HOME/.vim/
cp -rp $HOME/dotfiles/.vimrc $HOME/.vimrc
