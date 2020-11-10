APPLY=false

case $2 in

wp)
  sudo cp $DIR_PATH/files/nginx-wp.conf /etc/nginx/sites-available/$3.conf
  sudo sed -i "s/<domain>/$3/g" /etc/nginx/sites-available/$3.conf
  REPO=$(sed_escape_char $4 '/')
  sudo sed -i "s/<repo>/$REPO/g" /etc/nginx/sites-available/$3.conf

  APPLY=true
  ;;
*)
  print_error "Wrong host type."
  ;;

esac

if [ $APPLY == true ]; then
  sudo ln -s /etc/nginx/sites-available/$3.conf /etc/nginx/sites-enabled/
  sudo mkdir $NGINX_LOGS$3
  sudo service nginx restart
  sudo echo "127.0.0.1 $3 www.$3" >>/mnt/c/Windows/System32/drivers/etc/hosts
fi
