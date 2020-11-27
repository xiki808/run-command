shift

create_db() {
  mysql --defaults-extra-file=$DIR_PATH/files/sql-login.cnf -e "create database $1"
}

dump() {
  mysql --defaults-extra-file=$DIR_PATH/files/sql-login.cnf $1 >$1.dump.sql
}

restore() {
  mysql --defaults-extra-file=$DIR_PATH/files/sql-login.cnf $1 <$2
}

restore_info() {
  local DB_NAME=$(date +'%m%d%Y%H%M%s')
  local DB_NAME="temp_$DB_NAME"
  run sql create-db $DB_NAME
  mysql --defaults-extra-file=$DIR_PATH/files/sql-login.cnf $DB_NAME <$1
  shift
  echo -e $(mysql --defaults-extra-file=$DIR_PATH/files/sql-login.cnf -D $DB_NAME -e "$*")
  mysql --defaults-extra-file=$DIR_PATH/files/sql-login.cnf -e "drop database $DB_NAME"
}

case $1 in

help)
  echo -e "Type 'run sql [arg] help' for more information.\n"
  echo -e "           ${GREEN}sql${NC} | Run SQL queries."
  echo -e "          ${YELLOW}Args${NC} | ${BLUE}[query]${NC} SQL query type to be executed."
  echo -e "               | -> create-db ${BLUE}[db-name]${NC}"
  echo -e "               | -> dump ${BLUE}[db-name]${NC}"
  echo -e "               | -> restore ${BLUE}[db-name] [path-to-file]${NC}"
  echo -e "               | -> restore-info ${BLUE}[path-to-file] [query]${NC}"
  ;;
create-db)
  case $2 in

  help)
    echo -e "           ${GREEN}sql${NC} | Run SQL queries."
    echo -e "     ${GREEN}create-db${NC} | Create a MYSQL DB."
    echo -e "          ${YELLOW}Args${NC} | ${BLUE}[db-name]${NC} The name for DB to be created."
    exit 0
    ;;
  *)
    shift
    validate_args 1 $@
    create_db $@
    ;;

  esac
  ;;
dump)
  case $2 in

  help)
    echo -e "           ${GREEN}sql${NC} | Run SQL queries."
    echo -e "          ${GREEN}dump${NC} | Create MYSQL DB backup file."
    echo -e "          ${YELLOW}Args${NC} | ${BLUE}[db-name]${NC} The name for DB to be backed up."
    exit 0
    ;;
  *)
    shift
    validate_args 1 $@
    dump $@
    ;;

  esac
  ;;
restore)
  case $2 in

  help)
    echo -e "           ${GREEN}sql${NC} | Run SQL queries."
    echo -e "       ${GREEN}restore${NC} | Restore a MYSQL the DB backup file into a DB."
    echo -e "          ${YELLOW}Args${NC} | ${BLUE}[db-name]${NC} The name for DB to be restored."
    echo -e "               | ${BLUE}[path-to-file]${NC} The path of the backup file to be restored."
    exit 0
    ;;
  *)
    shift
    validate_args 2 $@
    restore $@
    ;;

  esac
  ;;
restore-info)
  case $2 in

  help)
    echo -e "           ${GREEN}sql${NC} | Run SQL queries."
    echo -e "       ${GREEN}restore${NC} | Run a query on a dump file."
    echo -e "          ${YELLOW}Args${NC} | ${BLUE}[path-to-file]${NC} The path of the backup file."
    echo -e "               | ${BLUE}[query]${NC} The query to execute."
    exit 0
    ;;
  *)
    shift
    validate_args 2 $@
    restore_info $@
    ;;

  esac
  ;;
*)
  print_error "Wrong command."
  ;;

esac
