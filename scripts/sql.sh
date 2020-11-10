case $2 in

help)
  echo -e "           ${GREEN}sql${NC} | Run SQL queries."
  echo -e "           ${YELLOW}Arg${NC} | ${BLUE}[command]*${NC} SQL command."
  echo -e "       ${YELLOW}Options${NC} | create-db [db-name]"
  echo -e "               | dump [db-name]"
  echo -e "               | restore [db-name] [path-to-dump]"
  ;;
create-db)
  mysql --defaults-extra-file=$DIR_PATH/files/sql-login.cnf -e "create database $3"
  ;;
dump)
  mysql --defaults-extra-file=$DIR_PATH/files/sql-login.cnf $3 >$3.dump.sql
  ;;
restore)
  mysql --defaults-extra-file=$DIR_PATH/files/sql-login.cnf $3 <$4
  ;;
*)
  print_error "Wrong SQL command."
  ;;

esac
