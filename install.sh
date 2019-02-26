#!/bin/bash

#========================================
# Brew update
#========================================

echo 'brew updating...'
brew update

#========================================
# Initial set up to install Apps
#========================================

read -r -p "Initial set up to install Apps? [y/N] " response
case $response in
    y|Y])
        echo 'Input password for Xcode license, pip and awscli'
        # Git
        brew install git

        # Xcode CLT
        xcode-select --install
        sudo xcodebuild -license

        # Add Package manager
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

read -r -p "Initial Applications with brew and caskroom? [y/N] " response
case $response in
    y|Y])
        ## Develop
        brew install vim
        brew install wget
        brew install tree
        brew install imagemagick
        brew install nkf
        brew install homebrew/php/composer

        brew cask install iterm2
        brew cask install sourcetree
        brew cask install sequel-pro
        brew cask install atom
        brew cask install sublime-text
        brew cask install mysqlworkbench

        brew install ansible
        brew install fabric
        brew cask install virtualbox
        brew cask install vagrant
        brew cask install docker

        brew cask install java

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
        brew cask install the-unarchiver
        brew cask install android-file-transfer
        brew cask install gyazo
        brew cask install appcleaner
        brew cask install flux
        brew cask install caffeine
        brew cask install shady
        brew cask install karabiner

        ## Communication
        brew cask install slack
        brew cask install skype

        ## Chef
        chef gem install knife-solo knife-zero
        ;;
esac

#========================================
# Install Applications from Appstore
#========================================

read -r -p "Install Applications from Appstore? [y/N] " response
case $response in
    y|Y])
        mas install 539883307 # LINE
        mas install 497799835 # Xcode
        ;;
esac

# Restart shell
exec $SHELL -l
