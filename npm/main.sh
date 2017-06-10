module_list=""

install_module () {
  npm i -g $1 &> /dev/null &
  spin $! "Installing $1..."
  [ $? -eq 0 ] \
    && ok "Installed $1!    " \
    || error "Couldn't install $1    "
}

install_modules () {
  local modules=$(cat ./npm/modules.txt)

  if [[ $module_list == "" ]]; then
    module_list=$(npm list -g --depth=0 -s)
  fi

  OIFS=IFS
  IFS=$'\n'
  for module in ${modules[@]}; do
    [[ $(echo $module_list | grep "$module@") ]] \
      && ok "$module is already installed!" \
      || install_module $module
  done
  IFS=OIFS
}

npm_routine () {
  local inpm=$1
  if [[ "$inpm" == "true" ]]; then
    title "npm modules"
      message "Installing npm modules..."
      install_modules
    title_off
  fi
}
