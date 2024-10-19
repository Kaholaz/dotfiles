ASDF_TMP=$(mktemp)
if asdf current golang >"$ASDF_TMP" 2>/dev/null; then
	ASDF_GO="$HOME/.asdf/installs/golang/$(awk -F' ' '{print $2}' <"$ASDF_TMP")"
fi
if [ -d "$ASDF_GO" ]; then
	ASDF_GOBIN="$ASDF_GO/packages/bin/"
	PATH="$ASDF_GOBIN:$PATH"
fi

export NVM_DIR="$HOME/.nvm"
if [ -s "$NVM_DIR/nvm.sh" ]; then
	\. "$NVM_DIR/nvm.sh"          # This loads nvm
fi
