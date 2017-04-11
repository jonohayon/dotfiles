install_base16 () {
  if [ -d "$HOME/.config/base16-shell" ]; then
    ok "base16-shell is already installed!"
  else
    git clone "https://github.com/chriskempson/base16-shell.git" "$HOME/.config/base16-shell" &> /dev/null &
    spin $! "Installing base16-shell..."
    [ $? -eq 0 ] \
      && ok "Installed base16-shell!" \
      || error "Couldn't install base16-shell"
  fi
}
