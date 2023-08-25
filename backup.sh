#!/bin/bash

date=$(date '+%Y-%m-%d %H:%M:%S')

# check to see is git command line installed in this machine
IS_GIT_AVAILABLE="$(git --version)"
if [[ $IS_GIT_AVAILABLE == *"version"* ]]; then
  echo "Git is Available"
else
  echo "Git is not installed"
  exit 1
fi

# Check git status
gs="$(git status | grep -i "modified")"
echo "${gs}"

# If there is a new change
if [[ $gs == *"modified"* ]]; then
    echo "push to Github"
    git add -u;
    git commit -m "chore: New backup ${date}";
    git push origin master
fi

