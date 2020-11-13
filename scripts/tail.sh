shift

case $1 in

help)
  echo -e "          ${GREEN}tail${NC} | Show colored log. Requires ccze package."
  echo -e "          ${YELLOW}Args${NC} | ${BLUE}[file-path]${NC} The file path of the log file to print and follow."
  ;;
*)
  shift
  validate_args 1 $@
  tail -f $1 | ccze -A
  ;;

esac
