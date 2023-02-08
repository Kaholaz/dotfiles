# To install:
git clone --bare <remote-git-repo-url> $HOME/.dotfiles

alias dotfiles='/usr/bin/git --git-dir=\$HOME/.dotfiles/ --work-tree=\$HOME'

dotfiles config --local status.showUntrackedFiles no

dotfiles checkout
