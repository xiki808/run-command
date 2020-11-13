shift

start() {
  sudo service nginx start
  sudo service php7.4-fpm start
  sudo service mysql start
}

restart() {
  sudo service nginx restart
  sudo service php7.4-fpm restart
  sudo service mysql restart
}

stop() {
  sudo service nginx stop
  sudo service php7.4-fpm stop
  sudo service mysql stop
}

case $1 in

help)
  echo -e "          ${GREEN}lemp${NC} | LEMP stack grouped services."
  echo -e "          ${YELLOW}Args${NC} | ${BLUE}[action]${NC} The action taken for the services."
  echo -e "               | -> start"
  echo -e "               | -> restart"
  echo -e "               | -> stop"
  echo -e "       ${YELLOW}Default${NC} | ${BLUE}start${NC}"
  ;;
restart)
  restart
  ;;
stop)
  stop
  ;;
*)
  start
  ;;

esac
