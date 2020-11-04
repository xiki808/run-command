#!/bin/bash

FULL_PATH=$(realpath $0)
DIR_PATH=$(dirname $FULL_PATH)

source "$DIR_PATH/config.sh"

if [ -n "$1" ]; then

  case $1 in

  lemp)
    source "$DIR_PATH/scripts/lemp.sh"
    ;;
  uninstall)
    source "$DIR_PATH/scripts/uninstall.sh"
    ;;

  esac
else
  echo -e "Scripts! Available commands:\n"
  echo -e "${GREEN}lemp${NC}          | Start LEMP stack services"
  echo -e "          ${YELLOW}Arg${NC} | ${BLUE}[action]${NC} The action taken for the servcies."
  echo -e "      ${YELLOW}Options${NC} | ${BLUE}Default:${NC} start | stop / restart"
  echo -e "${GREEN}uninstall${NC}     | Uninstall a package"
  echo -e "          ${YELLOW}Arg${NC} | ${BLUE}[name]${NC} The package name"
fi
