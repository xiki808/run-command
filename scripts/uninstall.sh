case $2 in

help)
  echo -e "     ${GREEN}uninstall${NC} | Uninstall a package."
  echo -e "           ${YELLOW}Arg${NC} | ${BLUE}[name]*${NC} The package name to be uninstalled."
  ;;
*)
  sudo apt-get autoremove --purge $2
  ;;

esac
