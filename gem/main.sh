gem_list=""

install_gem () {
  sudo gem install $1 &> /dev/null &
  spin $! "Installing $1..."
  [ $? -eq 0 ] \
    && ok "Installed $1!    " \
    || error "Couldn't install $1    "
}

install_gems () {
  local gems=$(cat ./gem/gems.txt)

  if [[ $gem_list == "" ]]; then
    gem_list=$(gem list)
  fi

  OIFS=IFS
  IFS=$'\n'
  for gem in ${gems[@]}; do
    [[ $(echo $gem_list | grep "$gem (") ]] \
      && ok "$gem is already installed!" \
      || install_gem $gem
  done
}

gem_routine () {
  title "Ruby gems"
    message "Installing the gems..."
    install_gems
  title_off
}
