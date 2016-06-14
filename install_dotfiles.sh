#!/bin/bash
cd ${0%/*}
CURDIR=$(pwd)

# Install Vundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install Molokai colorscheme
mkdir -p ~/.vim/colors
wget https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim
mv molokai.vim ~/.vim/colors

# install CtrlP VIM plugin
cd ~/.vim
git clone git@github.com:kien/ctrlp.vim.git bundle/ctrlp.vim


# Add hightlighting for Scala
mkdir -p ~/.vim/{ftdetect,indent,syntax} && for d in ftdetect indent syntax ; do curl -o ~/.vim/$d/scala.vim https://raw.githubusercontent.com/derekwyatt/vim-scala/master/syntax/scala.vim; done


# Install files
## File copying function
copy_file(){
    local SRC_FILE=$1
    local DEST_FILE=$2

    if [ -f $DEST_FILE ];
    then
       echo "File $DEST_FILE exists."
    else
      cp $SRC_FILE $DEST_FILE
    fi
}

SRC_FILE=$CURDIR/.bash_profile
DEST_FILE=~/.bash_profile
copy_file $SRC_FILE $DEST_FILE

SRC_FILE=$CURDIR/.vimrc
DEST_FILE=~/.vimrc
copy_file $SRC_FILE $DEST_FILE

SRC_FILE=$CURDIR/.tmux.conf
DEST_FILE=~/.tmux.conf
copy_file $SRC_FILE $DEST_FILE

SRC_FILE=$CURDIR/.gitconfig
DEST_FILE=~/.gitconfig
copy_file $SRC_FILE $DEST_FILE
