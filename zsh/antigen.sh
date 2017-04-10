install_antigen () {
  if [ -d "$HOME/.antigen" ]; then
    ok "Antigen is already installed!"
  else
    git clone "https://github.com/zsh-users/antigen.git" > "$HOME/.antigen" &> /dev/null &
    spin $! "Installing antigen..."
    [ $? -eq 0 ] \
      && ok "Installed antigen!" \
      || error "Couldn't install antigen"
  fi
}
