#!/bin/bash

if [ -n "$1" ]; then
  case $1 in

  lemp)
    source ./scripts/lemp.sh
    ;;
  esac
else
  echo -e 'Scripts! Available commands:\n'
  echo -e 'lemp     | Start LEMP stack services\n'
fi
