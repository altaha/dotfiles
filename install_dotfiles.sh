#!/bin/bash
cd ${0%/*}

# Install Vundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install Molokai colorscheme
mkdir -p ~/.vim/colors
wget https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim
mv molokai.vim ~/.vim/colors

# install CtrlP VIM plugin
cd ~/.vim
git clone git@github.com:kien/ctrlp.vim.git bundle/ctrlp.vim
cd ${0%/*}


#Install files
SRC_FILE=.bash_profile
DEST_FILE=~/.bash_profile
if [ -f $DEST_FILE ];
then
   echo "File $DEST_FILE exists."
else
  cp $SRC_FILE $DEST_FILE
fi

SRC_FILE=.vimrc
DEST_FILE=~/.vimrc
if [ -f $DEST_FILE ];
then
   echo "File $DEST_FILE exists."
else
  cp $SRC_FILE $DEST_FILE
fi

SRC_FILE=.tmux.conf
DEST_FILE=~/.tmux.conf
if [ -f $DEST_FILE ];
then
   echo "File $DEST_FILE exists."
else
  cp $SRC_FILE $DEST_FILE
fi
