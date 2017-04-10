# A function to keep the sudo privileges until the script is done
# Taken from https://github.com/yardnsm/dotfiles/blob/master/_setup/utils/ask.sh#L36
get_sudo () {
  sudo -v &> /dev/null
  while true; do
    sudo -n true
    sleep 60
    kill -0 "$$" || exit
  done &> /dev/null &
}

ask () {
  p_magenta " [?] $1 "
  read
}

ask_bool () {
  p_magenta " [?] $1 [y/N] "
  read -n 1
  printf "\n"
}

get_answer () {
  printf "$REPLY"
}

# Again, taken from Yarden's great codebase: https://github.com/yardnsm/dotfiles/blob/master/_setup/utils/ask.sh#L8
positive_answer () {
  [[ "$REPLY" =~ ^[Yy]$ ]] \
    && return 0 \
    || return 1
}
