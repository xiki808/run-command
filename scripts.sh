#!/bin/bash

if [ -n "$1" ]; then
  full_path=$(realpath $0)
  echo $full_path

  dir_path=$(dirname $full_path)
  echo $dir_path

  case $1 in

  lemp)
    source "$dir_path/scripts/lemp.sh"
    ;;

  esac
else
  echo -e 'Scripts! Available commands:\n'
  echo -e 'lemp     | Start LEMP stack services\n'
fi
