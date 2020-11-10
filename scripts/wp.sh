case $2 in

change-url)
  sudo cp $DIR_PATH/files/wp-live-to-local.sql $DIR_PATH/tmp/wp-live-to-local.sql
  OLD_URL=$(mysql --defaults-extra-file=$DIR_PATH/files/sql-login.cnf -D $3 -e "select option_value as '' from wp_options where option_name = 'siteurl'")
  OLD_URL=$(sed_escape_char $OLD_URL '/')
  sudo sed -i "s/<old>/$OLD_URL/g" $DIR_PATH/tmp/wp-live-to-local.sql
  NEW_URL=$(sed_escape_char $4 '/')
  sudo sed -i "s/<new>/$NEW_URL/g" $DIR_PATH/tmp/wp-live-to-local.sql
  mysql --defaults-extra-file=$DIR_PATH/files/sql-login.cnf -D $3 <$DIR_PATH/tmp/wp-live-to-local.sql
  ;;
fix-perm)
  sudo find $3 -type f -exec chmod 644 {} \;
  sudo find $3 -type d -exec chmod 755 {} \;
  sudo chmod 666 $3/wp-config.php
  ;;
*)
  print_error "Wrong WP command."
  ;;

esac
