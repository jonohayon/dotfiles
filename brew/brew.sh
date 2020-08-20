install_homebrew () {
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" &> /dev/null &
  spin $! "Installing Homebrew..."
  [ $? -eq 0 ] \
    && ok "Installed Homebrew!    " \
    || (error "Couldn't install Homebrew; Exiting..." && exit 1)
}

install_brew_formula () {
  brew install $1 &> /dev/null &
  spin $! "Installing $1..."
  [ $? -eq 0 ] \
    && ok "Installed $1!    " \
    || formula_error $1
}

install_brew_formulae () {
  brew tap ravenac95/sudolikeaboss &> /dev/null

  local formulae=$(cat "./brew/formulae/regular.txt")
  local brewList=$(brew list)
  OIFS=IFS
  IFS=$'\n'
  for formula in ${formulae[@]}; do
    echo $brewList | grep $formula &> /dev/null
    [ $? -eq 1 ] \
      && install_brew_formula $formula \
      || ok "$formula is already installed!"
  done
  IFS=OIFS
}
