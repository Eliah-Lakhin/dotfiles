#!/bin/bash
#
pushd ./utils/offirmo-shell-lib/bin/
source osl_lib_init.sh
source osl_lib_file.sh
popd

OSL_FILE_find_relative_path "$HOME" "$(pwd)" 
home_rel=$return_value

dotfiles=( "bashrc" "gitconfig" "linerc" "profile" "vim" "vimrc" "screenrc" 
  "ctags" )
for dotfile in "${dotfiles[@]}"
do
  rm -rf $HOME/.$dotfile
  ln -s $home_rel/custom/$dotfile $HOME/.$dotfile
done

dirs=( "vimbackup" )
for dir in "${dirs[@]}"
do
  mkdir -p $HOME/.$dir
done

