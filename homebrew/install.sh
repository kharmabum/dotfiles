#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

# Check for Homebrew
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."
  ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
fi

brew update
brew upgrade

FORMULAS=(
    node
    trash
    coreutils
    git
    zsh
    openssl
    redis
    wget
    tree
    python3
    openssl
    docker
)
brew install ${FORMULAS[@]}

brew cleanup
