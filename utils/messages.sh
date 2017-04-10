# Colors!
p_green () {
  printf "\e[0;32m$1\e[0m"
}

p_yellow () {
  printf "\e[0;33m$1\e[0m"
}

p_red () {
  printf "\e[0;31m$1\e[0m"
}

p_magenta () {
  printf "\e[0;35m$1\e[0m"
}

p_cyan () {
  printf "\e[0;36m$1\e[0m"
}

p_white () {
  printf "\e[0;37m$1\e[0m"
}

p_grey () {
  printf "\e[0;30m$1\e[0m"
}

# Functions!
title_on=0

title () {
  title_on=1
  p_grey "\n $(tput bold; tput smul)$1$(tput sgr0)\n"
}

title_off () {
  title_on=0
}

get_padding () {
  if [ $title_on -eq 1 ]; then
    printf " "
  else
    printf ""
  fi
}

error_count=0
error () {
  error_count=$((error_count+1))
  p_red " $(get_padding)[✘] $1\n"
}

warn () {
  p_yellow " $(get_padding)[!] $1\n"
}

ok () {
  p_green " $(get_padding)[✓︎] $1\n"
}

message () {
  p_cyan " $(get_padding)[#] $1\n"
}

disclaimer () {
  p_yellow " $(tput bold; tput smul)Disclaimer:$(tput sgr0)"
  p_yellow " These dotfiles are currently supported only in macOS.\n"
}

not_sudo () {
  error "Sorry, I need those permissions in order to work. Goodbye!"
  exit 1
}

script_finish () {
  echo ""
  p_yellow " $(tput bold)Important:$(tput sgr0)"
  p_white " restart your machine in order for all of the changes to apply.\n"
  p_magenta " That's it! Your machine is now set up.\n"
}
