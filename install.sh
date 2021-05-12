#!/bin/bash
read -p 'Would you like to install vim and dependencies?' install
if [[ $install =~ [yY] ]];then
  echo "---> installing vim"
  sudo apt update 
  sudo apt install -y vim

  echo "---> installing curl"
  sudo apt install -y curl

  echo "---> installing npm for coc"
  sudo apt install -y npm
fi

if [ -f ~/.vimrc ]; then
  read -p '.vimrc exist, would you like to replace it? [Ny]' replace
  echo "---> linking .vimrc"
  if [[ $replace =~ [yY] ]];then
    echo "---> replacing .vimrc"
    rm ~/.vimrc
    ln -s ~/.vim/.vimrc ~/.vimrc
  fi
else
  ln -s ~/.vim/.vimrc ~/.vimrc
fi

read -p 'Would you like to install personal stuff (like wakatime, usually not on a server)? [Ny]' personal
if [[ $personal =~ [yY] ]];then
  cat > personal.vim << EOM
call plug#begin('~/.vim/plug')
  Plug 'wakatime/vim-wakatime'
call plug#end()
EOM
  echo 'source personal.vim' >> .vimrc
fi

echo "---> installing vim-plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +'PlugInstall' +qa
