print_error() {
  echo -e "${RED}Error${NC} - $1"
}

sed_escape_char() {
  STRING=$(echo $1 | sed "s/\\$2/\\\\\\$2/g")

  echo $STRING
}

sed_replace_char() {
  STRING=$(echo $1 | sed "s/$2/$3/g")

  echo $STRING
}
