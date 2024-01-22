# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
	PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ]; then
	PATH="$HOME/.local/bin:$PATH"
fi

if [ -s "$HOME/.cargo/env" ]; then
	. "$HOME/.cargo/env"
fi

if [ -d "$HOME/go" ]; then
	GOPATH="$HOME/go"
fi

export NVM_DIR="$HOME/.nvm"
if [ -s "$NVM_DIR/nvm.sh" ]; then
	\. "$NVM_DIR/nvm.sh"          # This loads nvm
	\. "$NVM_DIR/bash_completion" # nvm bash completions
fi

if [ -s "$HOME/.local_profile" ]; then
	\. "$HOME/.local_profile"
fi

[ -f "/home/kaholaz/.ghcup/env" ] && source "/home/kaholaz/.ghcup/env" # ghcup-env

if [ -d "$HOME/.asdf" ]; then
	\. "$HOME/.asdf/asdf.sh"
	\. "$HOME/.asdf/completions/asdf.bash"
fi

if [ -f "$HOME/.local/share/pnpm" ]; then
	export PNPM_HOME="$HOME/.local/share/pnpm"
	case ":$PATH:" in
	*":$PNPM_HOME:"*) ;;
	*) export PATH="$PNPM_HOME:$PATH" ;;
	esac
fi

if [ -n "$ZSH_VERSION" ] && type "hugo" >/dev/null; then
	. <(hugo completion zsh)
fi
