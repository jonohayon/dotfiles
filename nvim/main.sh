install_vim_plug () {
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim &> /dev/null &
  spin $! "Installing vim-plug..."

  local rescode=$?
  [ $rescode -eq 0 ] \
    && ok "Installed vim-plug!    " \
    || error "Couldn't install vim-plug"

  return $rescode
}

install_python2_bindings () {
  pip2 install neovim --upgrade &> /dev/null &
  spin $! "Installing neovim python 2 bindings..."
  local rescode=$?
  [ $rescode -eq 0 ] \
    && ok "Installed python 2 bindings" \
    || error "Couldn't install python 2 bindings"
  return $rescode
}

install_python3_bindings () {
  pip3 install neovim --upgrade &> /dev/null &
  spin $! "Installing neovim python 3 bindings..."
  local rescode=$?
  [ $rescode -eq 0 ] \
    && ok "Installed python 3 bindings!" \
    || error "Couldn't install python 3 bindings"
  return $rescode
}

install_bindings () {
  install_python2_bindings
  install_python3_bindings
}

nvim_routine () {
  local invim=$1
  if [[ "$invim" == "true" ]]; then
    title "nvim configuration"
      install_bindings
      install_vim_plug
      if [ $? -eq 0 ]; then
        if [ -d "$HOME/.config/nvim" ]; then
          ok "nvim config directory already exists!"
        else
          message "Creating the nvim config directory..."
          mkdir -p "$HOME/.config/nvim"
          ok "Created the nvim config directory!"
        fi
        cp "./nvim/init.vim" "$HOME/.config/nvim"
        ok "Copied init.vim to $HOME/.config/nvim!"
      fi
    title_off
  fi
}
