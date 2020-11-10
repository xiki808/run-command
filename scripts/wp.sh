case $2 in

help)
  echo -e "            ${GREEN}wp${NC} | WordPress utilities."
  echo -e "           ${YELLOW}Arg${NC} | ${BLUE}[utility]*${NC} Use WP Utility."
  echo -e "       ${YELLOW}Options${NC} | change-url [db-name]* [new-url]* [db-prefix]"
  echo -e "               | fix-perm [wp-folder-path]*"
  ;;
change-url)
  sudo cp $DIR_PATH/files/wp-live-to-local.sql $DIR_PATH/tmp/wp-live-to-local.sql
  PREFIX=wp
  if [ -n "$5" ]; then
    PREFIX=$5
  fi
  sudo sed -i "s/<prefix>/$PREFIX/g" $DIR_PATH/tmp/wp-live-to-local.sql
  OLD_URL=$(mysql --defaults-extra-file=$DIR_PATH/files/sql-login.cnf -D $3 -e "select option_value as '' from ${PREFIX}_options where option_name = 'siteurl'")
  OLD_URL=$(sed_escape_char $OLD_URL '/')
  sudo sed -i "s/<old>/$OLD_URL/g" $DIR_PATH/tmp/wp-live-to-local.sql
  NEW_URL=$(sed_escape_char $4 '/')
  sudo sed -i "s/<new>/$NEW_URL/g" $DIR_PATH/tmp/wp-live-to-local.sql
  mysql --defaults-extra-file=$DIR_PATH/files/sql-login.cnf -D $3 <$DIR_PATH/tmp/wp-live-to-local.sql
  ;;
fix-perm)
  sudo chmod 777 $3
  ;;
*)
  print_error "Wrong WP command."
  ;;

esac
