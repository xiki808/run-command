#!/bin/bash

FULL_PATH=$(realpath $0)
DIR_PATH=$(dirname $FULL_PATH)

source "$DIR_PATH/config.sh"
source "$DIR_PATH/helpers.sh"

if [ -n "$1" ] && [ "help" -ne "$1" ]; then

  case $1 in

  utils | \
    stack | \
    uninstall | \
    tail | \
    host | \
    sql | \
    wp)

    source "$DIR_PATH/scripts/$1.sh"
    exit 0
    ;;
  *)
    print_error "Incorrect command."
    ;;

  esac
else
  echo -e "Run my custom commands!\n"
  echo -e "Type 'run [command] help' for more information.\n"
  echo -e "Available commands:\n"
  echo -e "         ${GREEN}utils${NC} | Shorthand commands."
  echo -e "         ${GREEN}stack${NC} | STACK services."
  echo -e "     ${GREEN}uninstall${NC} | Uninstall a package."
  echo -e "          ${GREEN}tail${NC} | Colored log output with follow."
  echo -e "          ${GREEN}host${NC} | Configure NGINX hosting."
  echo -e "           ${GREEN}sql${NC} | Run SQL queries."
  echo -e "            ${GREEN}wp${NC} | WordPress utilities."
  exit 0
fi
