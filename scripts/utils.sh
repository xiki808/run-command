shift

up_site() {
  run host wp $1 $2
  run sql create-db $3
  local DUMP=$(get_arg -d false $@)
  if [ $DUMP != "false" ]; then
    run sql restore $3 $DUMP
  fi
}

up_wpsite() {
  run utils up-site $1 $2 $3 $@
  run wp download $2 $@
  run wp create-config $2 $3 $4 $5 $@
  run wp change-url $3 "http://www.$1" $@
  run wp create-user $3 $@
}

restore_wpiste() {
  run restore $1 $2
  run wp change_url $1 $3 $@
  run wp create-user $1 $@
}

case $1 in

help)
  echo -e "Type 'run wp [arg] help' for more information.\n"
  echo -e "         ${GREEN}utils${NC} | Shorthand commands."
  echo -e "          ${YELLOW}Args${NC} | ${BLUE}[type]${NC} Type of utility."
  echo -e "               | -> up-site ${BLUE}[domain-name] [repo-path] [db-name] [path-to-file]${NC}"
  echo -e "               | -> up-wpsite ${BLUE}[domain-name] [repo-path] [db-name] [path-to-file] [new-url] -p${NC}"
  echo -e "               | -> restore-wpsite ${BLUE}[db-name] [path-to-file] [new-url] -p${NC}"
  echo -e "       ${YELLOW}Options${NC} | ${BLUE}-p${NC} DB prefix."
  ;;
up-site)
  case $2 in

  help)
    echo -e "         ${GREEN}utils${NC} | Shorthand commands."
    echo -e "       ${GREEN}up-site${NC} | Host a site and create a database restore from a backup file."
    echo -e "          ${YELLOW}Args${NC} | ${BLUE}[domain-name]${NC} The domain name used for the hosting. Example: domain.loc"
    echo -e "               | ${BLUE}[repo-path]${NC} The site repository absolute path."
    echo -e "               | ${BLUE}[db-name]${NC} The name for DB to be backed up."
    echo -e "       ${YELLOW}Options${NC} | ${BLUE}-d${NC} The path of the DB backup file to be restored."
    exit 0
    ;;
  *)
    shift
    validate_args 4 $@
    up_site $@
    ;;

  esac
  ;;
up-wpsite)
  case $2 in

  help)
    echo -e "         ${GREEN}utils${NC} | Shorthand commands."
    echo -e "       ${GREEN}up-site${NC} | Host a site and create a DB restore from a backup file."
    echo -e "          ${YELLOW}Args${NC} | ${BLUE}[domain-name]${NC} The domain name used for the hosting."
    echo -e "               | ${BLUE}[dir-path]${NC} The absolute path of WordPress installation directory. Directory needs to exist first."
    echo -e "               | ${BLUE}[db-name]${NC} The name for DB to be backed up."
    echo -e "               | ${BLUE}[db-user]${NC} User for DB."
    echo -e "               | ${BLUE}[db-pass]${NC} Password for DB."
    echo -e "       ${YELLOW}Options${NC} | ${BLUE}-p${NC} WordPress DB prefix."
    echo -e "               | ${BLUE}-v${NC} WordPress version to be downloaded."
    echo -e "               | ${BLUE}-d${NC} The path of the DB backup file to be restored."
    exit 0
    ;;
  *)
    shift
    validate_args 5 $@
    up_wpsite $@
    ;;

  esac
  ;;
restore-wpsite)
  case $2 in

  help)
    echo -e "         ${GREEN}utils${NC} | Shorthand commands."
    echo -e "       ${GREEN}up-site${NC} | Host a site and create a DB restore from a backup file."
    echo -e "          ${YELLOW}Args${NC} | ${BLUE}[db-name]${NC} The name for DB to be backed up.."
    echo -e "               | ${BLUE}[path-to-file]${NC} The path of the backup file to be restored."
    echo -e "               | ${BLUE}[new-url]${NC} The new URL"
    echo -e "       ${YELLOW}Options${NC} | ${BLUE}-p${NC} WordPress DB prefix."
    echo -e "               | ${BLUE}-d${NC} The path of the DB backup file to be restored."
    exit 0
    ;;
  *)
    shift
    validate_args 3 $@
    restore_wpsite $@
    ;;

  esac
  ;;
*)
  print_error "Wrong command."
  ;;

esac
