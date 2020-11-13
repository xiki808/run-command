shift

change_url() {
  sudo cp $DIR_PATH/files/wp-live-to-local.sql $DIR_PATH/tmp/wp-live-to-local.sql
  local PREFIX=$(get_arg -p wp $@)
  sudo sed -i "s/<prefix>/$PREFIX/g" $DIR_PATH/tmp/wp-live-to-local.sql
  local OLD_URL=$(mysql --defaults-extra-file=$DIR_PATH/files/sql-login.cnf -D $1 -e "SELECT option_value AS '' FROM ${PREFIX}_options WHERE option_name = 'siteurl'")
  local OLD_URL=$(sed_escape_char $OLD_URL '/')
  sudo sed -i "s/<old>/$OLD_URL/g" $DIR_PATH/tmp/wp-live-to-local.sql
  local NEW_URL=$(sed_escape_char $2 '/')
  sudo sed -i "s/<new>/$NEW_URL/g" $DIR_PATH/tmp/wp-live-to-local.sql
  mysql --defaults-extra-file=$DIR_PATH/files/sql-login.cnf -D $1 <$DIR_PATH/tmp/wp-live-to-local.sql
}

create_user() {
  sudo cp $DIR_PATH/files/wp-create-user.sql $DIR_PATH/tmp/wp-create-user.sql
  local PREFIX=$(get_arg -p wp $@)
  sudo sed -i "s/<prefix>/$PREFIX/g" $DIR_PATH/tmp/wp-create-user.sql
  local ID=$(mysql --defaults-extra-file=$DIR_PATH/files/sql-login.cnf -D $1 -e "SELECT ID AS '' FROM ${PREFIX}_users ORDER BY ID DESC LIMIT 1")
  local ID=$(($ID + 1))
  sudo sed -i "s/<id>/$ID/g" $DIR_PATH/tmp/wp-create-user.sql
  mysql --defaults-extra-file=$DIR_PATH/files/sql-login.cnf -D $1 <$DIR_PATH/tmp/wp-create-user.sql
}

case $1 in

help)
  echo -e "Type 'run wp [arg] help' for more information.\n"
  echo -e "            ${GREEN}wp${NC} | WordPress utilities."
  echo -e "          ${YELLOW}Args${NC} | ${BLUE}[utility]${NC} Use WP Utility."
  echo -e "               | -> change-url ${BLUE}[db-name] [new-url] -p${NC}"
  echo -e "               | -> create-user ${BLUE}[db-name] -p${NC}"
  echo -e "       ${YELLOW}Options${NC} | ${BLUE}-p${NC} DB prefix."
  ;;
change-url)
  case $2 in

  help)
    echo -e "            ${GREEN}wp${NC} | WordPress utilities."
    echo -e "    ${GREEN}change_url${NC} | Change WordPress DB site URL."
    echo -e "          ${YELLOW}Args${NC} | ${BLUE}[db-name]${NC} The WordPress DB name."
    echo -e "               | ${BLUE}[new-url]${NC} The new URL"
    echo -e "       ${YELLOW}Options${NC} | ${BLUE}-p${NC} DB prefix."
    exit 0
    ;;
  *)
    shift
    validate_args 2 $@
    change_url $@
    ;;

  esac
  ;;
create-user)
  case $2 in

  help)
    echo -e "            ${GREEN}wp${NC} | WordPress utilities."
    echo -e "   ${GREEN}create-user${NC} | Create a WP admin user with 'asdf' as password."
    echo -e "          ${YELLOW}Args${NC} | ${BLUE}[db-name]${NC} The WordPress DB name."
    echo -e "       ${YELLOW}Options${NC} | ${BLUE}-p${NC} DB prefix."
    exit 0
    ;;
  *)
    shift
    validate_args 1 $@
    create_user $*
    ;;

  esac
  ;;
*)
  print_error "Wrong WP command."
  ;;

esac
