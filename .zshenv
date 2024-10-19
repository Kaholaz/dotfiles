export HISTFILESIZE=1000000000
export HISTSIZE=1000000000

export EDITOR='nvim'

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
	GOBIN="$HOME/go/bin"
	PATH="$GOBIN:$PATH"
fi

ASDF_TMP=$(mktemp)
if asdf current golang >"$ASDF_TMP" 2>/dev/null; then
	ASDF_GO="$HOME/.asdf/installs/golang/$(awk -F' ' '{print $2}' <"$ASDF_TMP")"
fi
if [ -d "$ASDF_GO" ]; then
	ASDF_GOBIN="$ASDF_GO/packages/bin/"
	PATH="$ASDF_GOBIN:$PATH"
fi

[ -f "/home/kaholaz/.ghcup/env" ] && source "/home/kaholaz/.ghcup/env" # ghcup-env

if [ -f "$HOME/.local/share/pnpm" ]; then
	export PNPM_HOME="$HOME/.local/share/pnpm"
	case ":$PATH:" in
	*":$PNPM_HOME:"*) ;;
	*) export PATH="$PNPM_HOME:$PATH" ;;
	esac
fi

export PATH="$PATH:/home/kaholaz/.cache/scalacli/local-repo/bin/scala-cli"

# >>> coursier install directory >>>
export PATH="$PATH:/home/kaholaz/.local/share/coursier/bin"
# <<< coursier install directory <<<
