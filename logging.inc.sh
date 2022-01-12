RESTORE=$(echo -en '\033[0m')
RED=$(echo -en '\033[1;31m')
GREEN=$(echo -en '\033[1;32m')
YELLOW=$(echo -en '\033[1;33m')
MAGENDA=$(echo -en '\033[38;5;5m')
BOLD=$(echo -en '\033[1m')

__repeat() {
	local start=1
	local end=$1
	local str=$2
	local range=$(seq $start $end)
	for i in $range ; do echo -n "$str" ; done
}

__make_indent() {
  n=$(( ${INDENT_NUM:-1} - 1 ))
  indent='~'
  indent=$indent"$(__repeat $n '~~├─~' )"
  echo $indent | sed 's/~/ /g'
}

# Can be used to pipe
log_info () {
  indent=$(__make_indent)

  if [ -z "$1" ]; then
      while IFS= read -r line
      do
          printf "\r$indent$BOLD[${YELLOW}INFO${RESTORE}${BOLD}]${RESTORE} %s\n" "$line"
      done
  else
      while IFS= read -r line
      do
          printf "\r$indent$BOLD[${YELLOW}INFO${RESTORE}${BOLD}]${RESTORE} %s\n" "$line"
      done < <(printf '%s\n' "$1")
  fi
}

# Can be used to pipe output of some command - nests indentation.
log_cmd () {
  INDENT_NUM=$(( ${INDENT_NUM:-1} + 1 ))
  indent=$(__make_indent)

  if [ -z "$1" ]; then
      while IFS= read -r line
      do
          printf "\r$indent${MAGENDA}[LOG]:${RESTORE} %s\n" "$line"
      done
  else
      while IFS= read -r line
      do
          printf "\r$indent${MAGENDA}[LOG]:${RESTORE} %s\n" "$line"
      done < <(printf '%s\n' "$1")
  fi
}

log_user () {
  indent=$(__make_indent)
  printf "$indent$BOLD[${YELLOW} ?? ${RESTORE}${BOLD}]${RESTORE} %s\n" "$1"
}

log_success () {
  indent=$(__make_indent)
  printf "\r\033[2K$indent$BOLD[ ${GREEN}OK${RESTORE}${BOLD} ]${RESTORE} %s\n" "$1"
}

log_fail () {
  indent=$(__make_indent)
  printf "\r\033[2K$indent$BOLD[${RED}FAIL${RESTORE}${BOLD}]${RESTORE} %s\n" "$1"
  exit 1
}
