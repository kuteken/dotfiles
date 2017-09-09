#!/bin/bash

#========================================
# Make symbolic link for dotfiles
#========================================

read -r -p "Make symbolic link for dotfiles? [y/N] " response
case $response in
  y|Y)
    echo "Start: Make symbolic link for dotfiles"

    ROOT=$(cd $(dirname $0);pwd)

    ln -sf $ROOT/.bash_profile $HOME/.bash_profile
    ln -sf $ROOT/.bashrc $HOME/.bashrc
    ln -sf $ROOT/.vimrc $HOME/.vimrc
    ln -sf $ROOT/.gitconfig $HOME/.gitconfig
    ln -sf $ROOT/.gitignore $HOME/.gitignore
    ln -sf $ROOT/git-completion.bash $HOME/.git-completion.bash
    ln -sf $ROOT/git-prompt.sh $HOME/.git-prompt.sh
    ;;
esac

#========================================
# Install Applications
#========================================

read -r -p "Install Applications? [y/N] " response
case $response in
  y|Y])
    echo "Start: Install Application"

    sh $ROOT/install.sh
    ;;
esac

#========================================
# Set up vim bundler
#========================================

read -r -p "Set up vim bundler? [y/N] " response
case $response in
  y|Y])
    echo "Start: Set up vim bundler"

    VIM_BUNDLE_DIR="$HOME/.vim/bundle"
    NEOBUNDLE_DIR="$VIM_BUNDLE_DIR/neobundle.vim"
    if [ ! -e $NEOBUNDLE_DIR ]; then
      mkdir -p $VIM_BUNDLE_DIR
      git clone git://github.com/Shougo/neobundle.vim $NEOBUNDLE_DIR
    fi
    ;;
esac

#========================================
# Restart shell
#========================================

echo "Start: Restart shell"

echo "========================================"
echo "Finished!"
echo "Plz install adobe after this"

exec $SHELL -l
