shift

wp() {
  sudo cp $DIR_PATH/files/nginx-wp.conf /etc/nginx/sites-available/$1.conf
  configure_nginx $@
}

configure_nginx() {
  sudo sed -i "s/<domain>/$1/g" /etc/nginx/sites-available/$1.conf
  REPO=$(sed_escape_char $2 '/')
  sudo sed -i "s/<repo>/$REPO/g" /etc/nginx/sites-available/$1.conf
  sudo ln -s /etc/nginx/sites-available/$1.conf /etc/nginx/sites-enabled/
  sudo mkdir $NGINX_LOGS$1
  sudo service nginx restart
  sudo echo "127.0.0.1 $1 www.$1" >>/mnt/c/Windows/System32/drivers/etc/hosts
}

case $1 in

help)
  echo -e "Type 'run host [arg] help' for more information.\n"
  echo -e "          ${GREEN}host${NC} | Configure NGINX hosting."
  echo -e "          ${YELLOW}Args${NC} | ${BLUE}[type]${NC} The type of site being hosted."
  echo -e "               | -> wp ${BLUE}[domain-name] [repo-path]${NC}"
  ;;
wp)
  case $2 in

  help)
    echo -e "          ${GREEN}host${NC} | Configure NGINX hosting."
    echo -e "            ${GREEN}wp${NC} | Create a WordPress hosting."
    echo -e "          ${YELLOW}Args${NC} | ${BLUE}[domain-name]${NC} The domain name used for the hosting. Example: domain.loc"
    echo -e "               | ${BLUE}[repo-path]${NC} The site repository absolute path."
    exit 0
    ;;
  *)
    shift
    validate_args 2 $@
    wp $@
    ;;

  esac
  ;;
*)
  print_error "Wrong command."
  ;;

esac
