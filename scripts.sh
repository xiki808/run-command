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

  esac
else
  echo -e "Scripts! Available commands:\n"
  echo -e "${GREEN}lemp${NC}          | Start LEMP stack services"
  echo -e "          ${YELLOW}Arg${NC} | ${BLUE}[action]${NC} The action taken for the servcies."
  echo -e "      ${YELLOW}Options${NC} | start"
  echo -e "              | restart"
  echo -e "              | stop"
  echo -e "${GREEN}uninstall${NC}     | Uninstall a package"
  echo -e "          ${YELLOW}Arg${NC} | ${BLUE}[name]*${NC} The package name."
  echo -e "${GREEN}host${NC}          | Configure NGINX hosting"
  echo -e "          ${YELLOW}Arg${NC} | ${BLUE}[type]*${NC} The type of site being hosted."
  echo -e "      ${YELLOW}Options${NC} | wp"
  echo -e "              | ${BLUE}[domain-name]*${NC} The domain name."
  echo -e "              | ${BLUE}[repo-path]*${NC} The path of the site codebase."
  echo -e "${GREEN}sql${NC}           | Run SQL queries."
  echo -e "          ${YELLOW}Arg${NC} | ${BLUE}[command]*${NC} SQL command."
  echo -e "      ${YELLOW}Options${NC} | create-db [name]"
  echo -e "              | dump [db-name]"
  echo -e "              | restore [db-name] [path-to-dump]"
  echo -e "${GREEN}wp${NC}            | WordPress utilities."
  echo -e "          ${YELLOW}Arg${NC} | ${BLUE}[utility]*${NC} Use WP Utility."
  echo -e "      ${YELLOW}Options${NC} | change-url [db-name] [new-url]"
  echo -e "              | fix-perm [wp-folder-setup]"
fi
