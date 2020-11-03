#!/bin/bash

if [ -d "$HOME/bin" ]; then
  ln -s $PWD/scripts.sh $HOME/bin/scripts
  chmod +x $HOME/bin/scripts
else
  echo "Error: bin not found in user home directory! Create bin and add it to the path variable."
fi
