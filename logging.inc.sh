__repeat() {
	local start=1
	local end=${1:-2}
	local str="${2:-.}"
	local range=$(seq $start $end)
	for i in $range ; do echo -n "${str}"; done
}

__make_indent() {
  n=$(( ${INDENT_NUM:-2} ))
  indent=$(__repeat $n '.' )
  echo $indent
}

__make_nested_indent() {
  n=$(( ${INDENT_NUM:-2}+2 ))
  indent=$(__repeat $n '.' )
  echo $indent
}

# Can be used to pipe
log_info () {
  indent=$(__make_indent)

  if [ -z "$1" ]; then
      while IFS= read -r line
      do
          printf "\r$indent[ \033[0;33mINFO\033[0m ] %s\n" "$line"
      done
  else
      while IFS= read -r line
      do
          printf "\r$indent[ \033[0;33mINFO\033[0m ] %s\n" "$line"
      done < <(printf '%s\n' "$1")
  fi
}

# Can be used to pipe output of some command - nests indentation.
log_cmd () {
  indent=$(__make_nested_indent)

  if [ -z "$1" ]; then
      while IFS= read -r line
      do
          printf "\r$indent[ \033[38;5;5mCMD\033[0m ] %s\n" "$line"
      done
  else
      while IFS= read -r line
      do
          printf "\r$indent[ \033[38;5;5mCMD\033[0m ] %s\n" "$line"
      done < <(printf '%s\n' "$1")
  fi
}

log_user () {
  indent=$(__make_indent)
  printf "\r$indent[ \033[0;33m??\033[0m   ] %s\n" "$1"
}

log_success () {
  indent=$(__make_indent)
  printf "\r\033[2K$indent[  \033[00;32mOK\033[0m  ] %s\n" "$1"
}

log_fail () {
  indent=$(__make_indent)
  printf "\r\033[2K$indent[ \033[0;31mFAIL\033[0m ] %s\n" "$1"
  exit 1
}
