# Installation utilities.

source $YASLI_DIR/logging.inc.sh

install_wrapper() {
  # $1 command name
  # $2 function name which does installation
  # $3 [optional, pass "" for default] command that checks when tool exists
  # $4 [optional, pass "" for default] command executed if tool exists
  if [ -z $3 ]; then
    [ -x "$(command -v $1)" ] && exists=true || exists=false
  else
    $3 && exists=true || exists=false
  fi

  if "$exists"; then
    [ -z $4 ] && existing_cmd="" || existing_cmd=$4
    $existing_cmd 2>&1 | log_cmd || log_fail "Failed to perform existing case for $1"
    log_success "Skipped $1 (already installed)"
  else
    log_info "Installing $1"
    $2 2>&1 | log_cmd || log_fail "Failed to install $1"
    # If the installer was not written cleverly, it still might fail silently.
    if [ -z $3 ]; then
      [ -x "$(command -v $1)" ] || log_fail "Failed to install $1"
    else
      $3 || log_fail "Failed to install $1"
    fi
    log_success "Successfully installed $1"
  fi
}

# Required by some installers.
prepare_debian_installation() {
  export DEBIAN_FRONTEND=noninteractive
  log_info "Running apt update"
  $SUDO_CMD apt-get update 2>&1 | log_cmd || log_fail "Failed apt update"
  log_success "Success apt update"
}
