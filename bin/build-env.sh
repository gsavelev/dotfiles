#!/bin/bash
apt-get update

# zsh
apt-get install zsh -y
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
mv $HOME/dotfiles/.zshrc $HOME/.zshrc
zsh
