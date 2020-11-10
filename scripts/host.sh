APPLY=false

case $2 in

help)
  echo -e "          ${GREEN}host${NC} | Configure NGINX hosting."
  echo -e "           ${YELLOW}Arg${NC} | ${BLUE}[type]*${NC} The type of site being hosted."
  echo -e "       ${YELLOW}Options${NC} | wp"
  echo -e "               | ${BLUE}[domain-name]*${NC} The domain name."
  echo -e "               | ${BLUE}[repo-path]*${NC} The path of the site codebase."
  ;;
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
