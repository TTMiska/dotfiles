

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export KUBE_EDITOR='code --wait'

if [[ uname == "Linux" ]]; then
    export LDFLAGS="-L/home/linuxbrew/.linuxbrew/opt/isl@0.18/lib"
    export CPPFLAGS="-I/home/linuxbrew/.linuxbrew/opt/isl@0.18/include"
fi

if [[ ! -d "$HOME/dotfiles/zsh/custom.export.zsh" ]]; then
    source $HOME/dotfiles/zsh/custom.export.zsh
fi
