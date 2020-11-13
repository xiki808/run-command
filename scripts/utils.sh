shift

up_site() {
  run host wp $1 $2
  run sql create-db $3
  run sql restore $3 $4
}

up_wpsite() {
  run utils up-site $1 $2 $3 $4
  run wp $3 $5
}

case $1 in

help)
  echo -e "         ${GREEN}utils${NC} | Shorthand commands."
  echo -e "          ${YELLOW}Args${NC} | ${BLUE}[type]${NC} Type of utility."
  echo -e "               | -> up-site ${BLUE}[domain-name] [repo-path] [db-name] [path-to-file]${NC}"
  echo -e "               | -> up-wpsite ${BLUE}[domain-name] [repo-path] [db-name] [path-to-file] [new-url] -p${NC}"
  echo -e "       ${YELLOW}Options${NC} | ${BLUE}-p${NC} DB prefix."
  ;;
up-site)
  case $2 in

  help)
    echo -e "         ${GREEN}utils${NC} | Shorthand commands."
    echo -e "       ${GREEN}up-site${NC} | Host a site and create a database restore from a backup file."
    echo -e "          ${YELLOW}Args${NC} | ${BLUE}[domain-name]${NC} The domain name used for the hosting."
    echo -e "               | ${BLUE}[repo-path]${NC} The site repository absolute path."
    echo -e "               | ${BLUE}[db-name]${NC} The name for DB to be backed up."
    echo -e "               | ${BLUE}[path-to-file]${NC} The path of the backup file to be restored."
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
    echo -e "               | ${BLUE}[repo-path]${NC} The site repository absolute path."
    echo -e "               | ${BLUE}[db-name]${NC} The name for DB to be backed up."
    echo -e "               | ${BLUE}[path-to-file]${NC} The path of the backup file to be restored."
    echo -e "               | ${BLUE}[new-url]${NC} The new URL for the WordPress site."
    echo -e "       ${YELLOW}Options${NC} | ${BLUE}-p${NC} WordPress DB prefix."
    exit 0
    ;;
  *)
    shift
    validate_args 5 $@
    up_wpsite $@
    ;;

  esac
  ;;
*)
  print_error "Wrong WP command."
  ;;

esac
