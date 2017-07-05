install_extension () {
  code --install-extension $1 &> /dev/null &
  spin $! "Installing $1..."
  [ $? -eq 0 ] \
    && ok "Installed $1!    " \
    || error "Couldn't install $1"
}

install_extensions () {
  local exts=$(cat "./vscode/extensions.txt")
  OIFS=IFS
  IFS=$'\n'
  for ext in ${exts[@]}; do
    code --list-extensions | grep $ext &> /dev/null
    [ $? -eq 1 ] \
      && install_extension $ext \
      || ok "$ext is already installed!"
  done
  IFS=OIFS
}

vscode_routine () {
  local ivscode=$1

  if [[ $ivscode == "true" ]]; then
    title "VS Code"
      message "Installing extensions..."
      install_extensions

      message "Configuring VS Code..."
      ln -s "$HOME/dotfiles/vscode/snippets/" "~/Library/Application\ Support/Code/User/snippets"
      ln -s "$HOME/dotfiles/vscode/settings.json" "~/Library/Application\ Support/Code/User/settings.json"
      ok "Configured VS Code!"
    title_off
  fi
}
