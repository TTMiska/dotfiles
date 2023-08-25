# Dotfiles

This repository is meant to hold installation scripts for tools, configurations, exports and aliases that i use in day to day basis.

Please, do go through the scripts and configurations before you install this.
It is your responsibility to verify what you install on your computer and i take no account or responsibility for any issues.

## Setup

This documentation has step by step instructions on how to install the tools, configurations, exports and aliases.

### Prerequisites

These tools need to be installed, before you can clone and use this repo:

- Git

### Fork/Clone this repository

You can clone this repo, but i would recommend that you fork it for yourself first, so that you can commit changes and find it later.

### Install the tools, configurations, exports and aliases

Running `bash install.sh` in the directory that you cloned this repository to will install the tools and configurations within this repository.

### Secret exports

If you have secrets that need to be exported, you can run command `touch custom.export.zsh` and export secrets from there and these won't be committed to git.

## Making changes and committing them

Make sure you have forked the repository and you are using the correct remote url, otherwise you won't be able to make changes.
Once you have made changes to the scripts you can run `bash backup.sh` or you can manually do git add, commit & push commands.
