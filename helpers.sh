print_error() {
  echo -e "${RED}Error${NC} - $1"
  exit 1
}

sed_escape_char() {
  local STRING=$(echo $1 | sed "s/\\$2/\\\\\\$2/g")

  echo $STRING
}

sed_replace_char() {
  local STRING=$(echo $1 | sed "s/$2/$3/g")

  echo $STRING
}

get_arg() {
  local OPTION=$1
  local RETURN=$2

  shift

  while (($#)); do
    case "$1" in

    $OPTION)
      local RETURN=$2
      break
      ;;

    *)
      shift
      ;;

    esac
  done

  if [ -z "$RETURN" ]; then
    print_error "Option $OPTION is invalid."
  fi

  echo $RETURN
}

validate_args() {
  local ARGS=$1

  shift

  if [ $ARGS -lt $# ]; then
    print_error "Invalid number of arguments."
  fi
}
