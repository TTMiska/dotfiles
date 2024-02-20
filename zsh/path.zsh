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

if [[ uname == "Linux" ]]; then
	export ANDROID_HOME="$HOME/Android/Sdk"
	export PATH="$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$PATH"
elif [[ uname == "Darwin" ]]; then
	export ANDROID_HOME="$HOME/Library/Android/sdk"
	export PATH="$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$PATH"
fi
# Linux specific stuff
if [[ uname == "Linux" ]]; then
	eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
fi
