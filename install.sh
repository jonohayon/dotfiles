#!/usr/bin/env bash

source "./utils/main.sh" # Importing the utilities

if ! [[ $(uname -s) == "Darwin" ]]; then
  error "These dotfiles are supported only in macOS. Sorry! :("
  exit 1
fi

p_yellow "  ____        _    __ _ _           
 |  _ \  ___ | |_ / _(_) | ___  ___ 
 | | | |/ _ \| __| |_| | |/ _ \/ __|
 | |_| | (_) | |_|  _| | |  __/\__ \\
 |____/ \___/ \__|_| |_|_|\___||___/\n\n"
message "Welcome to my Dotfiles!\n"

disclaimer
ask_bool "Do you wish to continue?"

if !(positive_answer); then
  error "Okay, maybe another time. Goodbye!"
  exit 1
fi

message "First of all, I need your sudo permissions."
get_sudo
[ $? -eq 0 ] \
  && ok "Got your sudo, thanks!" \
  || not_sudo

source "./brew/main.sh"
brew_routine

source "./zsh/main.sh"
zsh_routine

source "./macos/main.sh"
macos_routine

source "./npm/main.sh"
npm_routine

source "./gem/main.sh"
gem_routine

source "./sublime/main.sh"
sublime_routine

title "Manual things left to do"
  message "1. Set up AWS credentials"
  message "2. Install Xcode"
title_off

script_finish
