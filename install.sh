#!/bin/bash

if [ -d "$HOME/bin" ]; then
  sudo mkdir $HOME/bin
fi

ln -s $PWD/scripts.sh $HOME/bin/scripts
chmod +x $HOME/bin/scripts
