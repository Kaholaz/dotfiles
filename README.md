# To install:
git clone --bare git@github.com:Kaholaz/dotfiles.git $HOME/.dotfiles

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

dotfiles config --local status.showUntrackedFiles no

dotfiles restore --staged . (WARNING: DELETES ANY LOCAL DOTFILES)

dotfiles checkout
