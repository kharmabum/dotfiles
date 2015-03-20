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

TAPS=(
    homebrew/dupes
    homebrew/versions
    caskroom/cask
    caskroom/fonts
    caskroom/versions
)
brew tap ${TAPS[@]}

FORMULAS=(
    node
    ruby
    trash
    coreutils
    grc
    git
    spark
    zsh
    hub
    openssl
    redis
    heroku
    wget
    tree
    python3
    openssl
    imagemagick
    caskroom/cask/brew-cask
)
brew install ${FORMULAS[@]}

CASKS=(
    skype
    reveal
    google-hangouts
    silverlight
    dropbox
    google-chrome
    flash
    kdiff3
)
brew cask install ${CASKS[@]}

brew cleanup
