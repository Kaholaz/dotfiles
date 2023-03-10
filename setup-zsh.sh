#!/bin/bash
if [ ! $HOME/.oh-my-zsh ]; then sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"; fi
if [ ! $HOME/.zplug ]; then curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh; fi
zplug install

# Start zsh
/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME restore --staged $HOME/.zshrc
/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME restore $HOME/.zshrc
zsh

