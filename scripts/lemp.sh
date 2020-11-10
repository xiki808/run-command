case $2 in

help)
  echo -e "          ${GREEN}lemp${NC} | Start LEMP stack services."
  echo -e "           ${YELLOW}Arg${NC} | ${BLUE}[action]${NC} The action taken for the servcies."
  echo -e "       ${YELLOW}Options${NC} | start"
  echo -e "               | restart"
  echo -e "               | stop"
  ;;
restart)
  sudo service nginx restart
  sudo service php7.4-fpm restart
  sudo service mysql restart
  ;;
stop)
  sudo service nginx stop
  sudo service php7.4-fpm stop
  sudo service mysql stop
  ;;
*)
  sudo service nginx start
  sudo service php7.4-fpm start
  sudo service mysql start
  ;;

esac
