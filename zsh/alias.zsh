# Enable aliases to be sudo’ed
alias sudo="sudo "

# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Shortcuts
alias ls="ls --color"
alias e="$EDITOR"

# Download file and save it with filename of remote file
alias get="curl -O -L"

# Make a directory and cd to it
function take() {
  mkdir -p $@ && cd ${@:$#}
}

# Cd to Git repository root folder
function gitr() {
  cd "./$(git rev-parse --show-cdup 2>/dev/null)" 2>/dev/null
}

# git clone and cd to a repo directory
function gitcd() {
  git clone $@
  if [ "$2" ]; then
    cd "$2"
  else
    cd $(basename "$1" .git)
  fi
  if [[ -r "./yarn.lock" ]]; then
    yarn
  elif [[ -r "./package-lock.json" ]]; then
    npm install
  fi
}

# git checkout develop, fetch origin and then checkout your next branch
function gitfc() {
  git checkout develop && git fetch && git checkout $@
}

if [[ ! -d "$HOME/dotfiles/zsh/custom.alias.zsh" ]]; then
    source $HOME/dotfiles/zsh/custom.alias.zsh
fi
