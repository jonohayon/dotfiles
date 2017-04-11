source "./brew/brew.sh"
source "./brew/cask.sh"

formula_error () {
  error "Couldn't install $1"
}

brew_update () {
  brew update &> /dev/null &
  spin $! "Updating Homebrew..."
  [ $? -eq 0 ] \
    && ok "Updated Homebrew!   " \
    || error "Couldn't update Homebrew    "
}

brew_routine () {
  title "Homebrew & Homebrew Cask"
    message "Looking for Homebrew..."
    if [ $(cmd_exists "brew") -eq 0 ]; then
      ok "Homebrew is already installed!"
    else
      install_homebrew
    fi
    brew_update

    install_cask

    message "Installing regular formulae..."
    install_brew_formulae

    # message "Installing cask formulae..."
    # install_cask_formulae
  title_off
}
