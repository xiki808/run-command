#!/bin/bash

FULL_PATH=$(realpath $0)
DIR_PATH=$(dirname $FULL_PATH)

source "$DIR_PATH/helpers.sh"

if [ ! -d "$HOME/bin" ]; then
  sudo mkdir $HOME/bin
fi

cp $PWD/run.sh $HOME/bin/run
chmod +x $HOME/bin/run

ADD_TO_PATH=false
array=(${PATH//:/ })
for i in "${array[@]}"; do
  if [ $i == "$HOME/bin" ]; then
    ADD_TO_PATH=true
  fi
done

if [ $ADD_TO_PATH = false ]; then
  export PATH=$PATH:$HOME/bin
fi
