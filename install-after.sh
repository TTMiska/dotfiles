#!/bin/zsh

# Set the main shell to ZSH
if [[ $SHELL != "/bin/zsh" ]]; then
  echo "Set main shell to ZSH"
  chsh -s $(which zsh)
fi

# Install Homebrew tool
if [[ ! -f "/usr/local/bin/brew" ]]; then
  echo "Install Homebrew tool"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# ZSH plugins and themes
if [[ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]]; then
  echo "Installing zsh-syntax-highlighting"
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi
if [[ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]]; then
  echo "Installing zsh-autosuggestions"
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi
if [[ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]]; then
  echo "Installing powerlevel10k"
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

# NVM install & exports
if [[ ! -d "$HOME/.nvm" ]]; then
  echo "Installing nvm"
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
fi

# Fonts install
# if [[ ! -z `find '/usr/share/fonts/truetype' -name 'Menlo'` ]]; then
#     echo 'Installing font Menlo'
#     sudo cp -r ./fonts/Menlo/* /usr/share/fonts/truetype
# fi
# if [[ ! -z `find '/usr/share/fonts/truetype' -name 'Meslo'` ]]; then
#     echo 'Installing font Meslo'
#     sudo cp -r ./fonts/Meslo/* /usr/share/fonts/truetype
# fi
# if [[ ! -z `find '/usr/share/fonts/truetype' -name 'DejaVu'` ]]; then
#     echo 'Installing font Dejavu'
#     sudo cp -r ./fonts/Dejavu/* /usr/share/fonts/truetype
# fi

# Check if we have brew installed, and then install tools using brew
if [[ -f "/usr/local/bin/brew" ]]; then
  # Update brew casks
  brew update

  # Install AzureCLI
  if [[ ! -f "/usr/local/bin/az" ]]; then
    brew install azure-cli
  fi

  # Install kubectl
  if [[ ! -f "/usr/local/bin/kubectl" ]]; then
    brew install kubectl
  fi

  # Install docker cli
  if [[ ! -f "/usr/local/bin/docker" ]]; then
    brew install docker
  fi

  # Colima install
  if [[ ! -f "$HOME/.colima"  ]]; then
    brew install colima
  fi
fi

# && uname == "Darwin"

source ~/.zshrc
