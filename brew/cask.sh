install_cask () {
  warn "TODO - Implement install_cask"
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
