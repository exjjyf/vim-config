#!/bin/sh

ln -s $(pwd)/.vimrc ~/.vimrc
mkdir -p ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/vundle

#安装所有插件
vim +PluginInstall +qall

sudo apt install cmake build-essential python3-dev

cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
python3 install.py --clangd-completer
