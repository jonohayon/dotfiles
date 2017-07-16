# Main utilities file
source ./utils/messages.sh # Source message utilities file
source ./utils/questions.sh # Source question utilities file
source ./utils/spinner.sh # Source spinner utilities file

# Sodmo is da king! https://github.com/yardnsm/dotfiles/blob/master/_setup/utils/commands.sh#L8
cmd_exists () {
  command -v "$1" &> /dev/null
  echo $?
}

welcome_routine () {
  message "First of all, I need your sudo permissions."
  get_sudo
  [ $? -eq 0 ] \
    && ok "Got your sudo, thanks!" \
    || not_sudo

  if [[ -f "$HOME/dotfiles/.nickname" ]]; then
    nickname=$(cat "$HOME/dotfiles/.nickname")
    ok "Hello $USER@$nickname!"
  else
    ask "What's your machine's nickname (default: $USER-computer)?"
    possible_nick=$(get_answer)
    if [[ "$possible_nick" == "" ]]; then
      possible_nick="$USER-computer"
    fi
    echo $possible_nick > "$HOME/dotfiles/.nickname"
    ok "Configured your machine nickname!"
  fi
}
