# Prepend $PATH without duplicates
function _prepend_path() {
	if ! $( echo "$PATH" | tr ":" "\n" | grep -qx "$1" ) ; then
		PATH="$1:$PATH"
	fi
}

# Construct $PATH
PATH="$PATH:/usr/local/bin:/usr/bin:/usr/sbin"
[ -d "$HOME/node_modules/.bin" ] && _prepend_path "~/node_modules/.bin"
PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH

# Linux specific stuff
if [[ uname == "Linux" ]]; then
	eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
fi
