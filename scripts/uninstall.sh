shift

case $1 in

help)
  echo -e "     ${GREEN}uninstall${NC} | Uninstall a package."
  echo -e "          ${YELLOW}Args${NC} | ${BLUE}[name]${NC} The package name to be uninstalled."
  ;;
*)
  shift
  validate_args 1 $@
  sudo apt-get autoremove --purge $1
  ;;

esac
