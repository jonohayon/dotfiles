#!/usr/bin/env bash

source "./utils/main.sh" # Importing the utilities

if ! [[ $(uname -s) == "Darwin" ]]; then
  error "These dotfiles are supported only in macOS. Sorry! :("
  exit 1
fi

# Option parsing
dot_cask="true"
dot_brew="true"
dot_zsh="true"
dot_git="true"
dot_macos="true"
dot_npm="true"
dot_gem="true"
dot_sublime="true"
dot_nvim="true"

edit_options () {
  # Update mode
  if [[ "$1" == "update" ]]; then
    dot_cask="false"
    dot_git="false"
    dot_zsh="false"
    dot_sublime="false"
    return
  fi
  eval "dot_$1=\"$2\""
  return
}

while [[ "$1" != "" ]]; do
  case $1 in
    -w | --with )
      shift
      message "Enabled $1"
      edit_options $1 "true"
      ;;
    -wo | --without )
      shift
      message "Disabled $1"
      edit_options $1 "false"
      ;;
    -u | --update )
      message "Installing in update mode"
      edit_options "update"
      ;;
  esac
  shift
done

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
brew_routine "$dot_brew" "$dot_cask"

source "./zsh/main.sh"
zsh_routine "$dot_zsh"

source "./git/main.sh"
git_routine "$dot_git"

source "./macos/main.sh"
macos_routine "$dot_macos"

source "./npm/main.sh"
npm_routine "$dot_npm"

source "./gem/main.sh"
gem_routine "$dot_gem"

source "./sublime/main.sh"
sublime_routine "$dot_sublime"

source "./nvim/main.sh"
nvim_routine "$dot_nvim"

title "Manual things left to do"
  message "1. Set up AWS credentials"
  message "2. Install Xcode"
title_off

script_finish
