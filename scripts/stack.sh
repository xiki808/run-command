shift

lemp() {
  ACTION=$1
  if [ -z "$ACTION" ]; then
    ACTION=start
  fi
  sudo service apache2 stop
  sudo service nginx $ACTION
  sudo service php7.4-fpm $ACTION
  sudo service mysql $ACTION
}

lamp() {
  ACTION=$1
  if [ -z "$ACTION" ]; then
    ACTION=start
  fi
  sudo service nginx stop
  sudo service apache2 $ACTION
  sudo service php7.4-fpm $ACTION
  sudo service mysql $ACTION
}

case $1 in

help)
  echo -e "         ${GREEN}stack${NC} | STACK services."
  echo -e "          ${YELLOW}Args${NC} | ${BLUE}[stack]${NC} The type of stack needed. lemp or lamp."
  echo -e "               | ${BLUE}[action]${NC} The action taken for the services."
  echo -e "               | -> start"
  echo -e "               | -> restart"
  echo -e "               | -> stop"
  echo -e "       ${YELLOW}Default${NC} | ${BLUE}start${NC}"
  ;;
lemp)
  shift
  lemp
  ;;
lamp)
  shift
  lamp
  ;;
*)
  print_error "Wrong command."
  ;;

esac
