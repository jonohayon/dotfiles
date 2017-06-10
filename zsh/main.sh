source "./zsh/antigen.sh"
source "./zsh/base16.sh"

setup_zshrc () {
  message "Copying files..."
  cp "./zsh/main.zshrc" "$HOME/.zshrc"
  cp "./zsh/main.zshtheme" "$HOME/.zshtheme"
  ok "zshrc and zshtheme are now at $HOME!"
}

zsh_routine () {
  local izsh=$1
  if [[ $izsh == "true" ]]; then
    title "ZSH configuration"
      install_antigen
      install_base16
      setup_zshrc
    title_off
  fi
}
