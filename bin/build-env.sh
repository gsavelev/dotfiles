#!/bin/bash
sudo apt-get update

# zsh
sudo apt-get install zsh -y
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
mv ~/dotfiles/.zshrc ~/.zshrc
zsh

# vim
sudo apt-get install zsh -y
mv ~/dotfiles/.vimrc ~/.vimrc

# cleanup
rm -rf ~/dotfiles
