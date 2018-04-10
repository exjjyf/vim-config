#!/bin/sh

ln -s $(pwd)/.vimrc ~/.vimrc
mkdir -p ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/vundle

#安装所有插件
vim +PluginInstall +qall

sudo apt install cmake build-essential

cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
cp third_party/ycmd/cpp/ycm/.ycm_extra_conf.py ~/
