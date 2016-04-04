#!/bin/bash

#========================================
# Brew update
#========================================

echo 'brew updating...'
brew update

#========================================
# Initial set up
#========================================

read -r -p "Initial set up? [y/N] " response
case $response in
    y|Y])
        echo 'Input password for Xcode license, pip and awscli'

        # Xcode CLT
        xcode-select --install
        sudo xcodebuild -license

        # Add Package manager
        ## homebrew
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        ## AWS CLI
        sudo easy_install pip
        sudo pip install awscli --upgrade --ignore-installed six # For OSX 10.11
        ## Cask room / mas
        brew tap caskroom/cask
        brew install argon/mas/mas
        ## anyenv
        git clone https://github.com/riywo/anyenv ~/.anyenv
        anyenv install rbenv

        ;;
esac

#========================================
# Install Applications with brew and caskroom
#========================================

## Develop
brew cask install iterm2
brew install macvim --with-lua --with-cscope --override-system-vim
brew cask install sourcetree
brew cask install sequel-pro
brew cask install atom
brew cask install sublime-text

brew install ansible
brew install fabric
brew cask install chefdk
brew cask install virtualbox
brew cask install vagrant
brew cask install dockertoolbox

brew cask install java
brew install nkf

## Network
brew install dnsmasq

## Media
brew cask install imageoptim
brew cask install vlc
brew cask install google-nik-collection

## Utility
brew cask install google-japanese-ime

brew cask install google-chrome
brew cask install evernote
brew cask install alfred
brew cask install the-unarchiver
brew cask install android-file-transfer
brew cask install gyazo
brew cask install shupapan
brew cask install appcleaner
brew cask install cheatsheet
brew cask install flux
brew cask install caffeine
brew cask install shady
brew cask install karabiner

## Communication
brew cask install slack
brew cask install skype
brew cask install limechat

## linkapps
brew linkapps

#========================================
# Install Applications from Appstore
#========================================

read -r -p "Install Applications from Appstore? [y/N] " response
case $response in
    y|Y])
        mas install 539883307 # LINE
        mas install 497799835 # Xcode
        mas install 928494006 # Pop hub
        ;;
esac

# Restart shell
exec $SHELL -l
