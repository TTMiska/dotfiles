#!/bin/bash

# TODO: was this still used by something?
USERNAME=$(whoami)

# Make a backup of the existing files if there are any
cp ~/.zshrc ~/.zshrc.backup
cp ~/.bashrc ~/.bashrc.backup
cp ~/.p10k ~/.p10k.backup

# Remove the main files after making backups
# TODO: we could use move instead, if the terminal command is universal
rm -rf ~/.zshrc
rm -rf ~/.bashrc
rm -rf ~/.p10k.zsh

# Make empty files for the configurations
# TODO: is this universal command or is it mac specific?
touch ~/.zshrc
touch ~/.bashrc
touch ~/.p10k.zsh

# We are actually not including any lines in the files in home directory, and instead we are souring the files from this repository.
# By sourcing the files from here, we can do edits to the files located under this folder and also save them to git.
echo "source ~/dotfiles/.zshrc" > ~/.zshrc
echo "source ~/dotfiles/.bashrc" > ~/.bashrc
echo "source ~/dotfiles/.p10k.zsh" > ~/.p10k.zsh

# Install Oh My ZSH
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  echo "Installing Oh My ZSH"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Install tools using ZSH as the SHELL
zsh ./install-after.sh
