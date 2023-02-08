#!/bin/bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Start zsh
/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME restore --staged $HOME/.zshrc
/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME restore $HOME/.zshrc
zsh

