install_cask () {
  brew tap caskroom/cask &> /dev/null &
  spin $! "Installing Homebrew Cask..."
  [ $? -eq 0 ] \
    && ok "Installed Homebrew Cask!" \
    || error "Couldn't install Homebrew Cask"

  brew tap caskroom/fonts &> /dev/null &
  spin $! "Installing Cask fonts..."
  [ $? -eq 0 ] \
    && ok "Installed Cask fonts!" \
    || error "Couldn't install Cask fonts"

  brew tap caskroom/versions
  spin $! "Installing Cask alternate versions..."
  [ $? -eq 0 ] \
    && ok "Installed Cask alternate versions!" \
    || error "Couldn't install Cask alternate versions"
}

install_cask_formula () {
  brew cask install $1 &> /dev/null &
  spin $! "Installing $1..."
  [ $? -eq 0 ] \
    && ok "Installed $formula!    " \
    || formula_error $formula
}

install_cask_formulae () {
  local formulae=$(cat "./brew/formulae/cask.txt")
  OIFS=IFS
  IFS=$'\n'
  for formula in ${formulae[@]}; do
    brew cask list | grep $formula &> /dev/null
    [ $? -eq 1 ] \
      && install_cask_formula $formula \
      || ok "$formula is already installed!"
  done
  IFS=OIFS
}
