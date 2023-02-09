export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="afowler"

source $ZSH/oh-my-zsh.sh

# :: Zplug - ZSH plugin manager
export ZPLUG_HOME=$HOME/.zplug

# Check if zplug is installed
if [[ ! -d $ZPLUG_HOME ]]; then
  git clone https://github.com/zplug/zplug $ZPLUG_HOME
  source $ZPLUG_HOME/init.zsh && zplug update --self
fi

# Essential
source $ZPLUG_HOME/init.zsh

# Zplug plugins
zplug "zplug/zplug", hook-build:"zplug --self-manage"

# zsh users
zplug "zsh-users/zsh-syntax-highlighting", defer:3, on:"zsh-users/zsh-syntax-highlighting"

# Plugins from oh my zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh

# Base16 (This should be the last plugin)
zplug chriskempson/base16-shell, from:github
zplug load
base16_gruvbox-dark-hard

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# Attach to a tmux session on startup
if [ -z "$TMUX" ]; then
    tmux attach -t Default || tmux new -s Default
fi

source .aliases

