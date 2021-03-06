git_routine () {
  local igit=$1
  if [[ "$igit" == "true" ]]; then
    title "Git configuration"
      ask "What's your name?"
      local name=$(get_answer)
      ask "What's your email?"
      local email=$(get_answer)

      git config --global user.name "$name"
      git config --global user.email "$email"
      ok "Configured Git!"
    title_off
  fi
}
