#!/bin/bash

FULL_PATH=$(realpath $0)
DIR_PATH=$(dirname $FULL_PATH)

source "$DIR_PATH/config.sh"
source "$DIR_PATH/helpers.sh"

if [ -n "$1" ]; then

  case $1 in

  lemp)
    source "$DIR_PATH/scripts/lemp.sh"
    ;;
  uninstall)
    source "$DIR_PATH/scripts/uninstall.sh"
    ;;
  host)
    source "$DIR_PATH/scripts/host.sh"
    ;;
  sql)
    source "$DIR_PATH/scripts/sql.sh"
    ;;
  wp)
    source "$DIR_PATH/scripts/wp.sh"
    ;;
  *)
    print_error "Incorrect command."
    ;;

  esac
else
  echo -e "Scripts!\n"
  echo -e "Type 'scripts [command] help' for more information.\n"
  echo -e "Available commands:\n"
  echo -e "          ${GREEN}lemp${NC} | Start LEMP stack services."
  echo -e "     ${GREEN}uninstall${NC} | Uninstall a package."
  echo -e "          ${GREEN}host${NC} | Configure NGINX hosting."
  echo -e "           ${GREEN}sql${NC} | Run SQL queries."
  echo -e "            ${GREEN}wp${NC} | WordPress utilities."
  echo -e "\n"
fi
