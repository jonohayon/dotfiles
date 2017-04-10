source "./zsh/antigen.sh"

setup_zshrc () {
  message "Copying files..."
  cp "./zsh/main.zshrc" "$HOME/.zshrc"
  cp "./zsh/main.zshtheme" "$HOME/.zshtheme"
  ok "zshrc and zshtheme are now at $HOME!"
}

zsh_routine () {
  title "ZSH configuration"
    install_antigen
    setup_zshrc
  title_off
}
