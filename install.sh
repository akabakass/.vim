#!/bin/bash
echo "---> installing vim-gtk"
#sudo apt update && sudo apt install vim-gtk git

echo "---> linking .vimrc"
if [ -f ~/.vimrc ]; then
  read -p '.vimrc exist, would you like to replace it? [Ny]' replace
  if [[ $replace =~ [yY] ]];then
    echo "---> replacing .vimrc"
    rm ~/.vimrc
    ln -s ~/.vim/.vimrc ~/.vimrc
  fi
else
  ln -s ~/.vim/.vimrc ~/.vimrc
fi

echo "---> installing vim-plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
