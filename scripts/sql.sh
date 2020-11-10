case $2 in

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
