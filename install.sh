#!/usr/bin/env bash

source "./utils/main.sh" # Importing the utilities

if ! [[ $(uname -s) == "Darwin" ]]; then
  error "These dotfiles are supported only in macOS. Sorry! :("
  exit 1
fi

############   WARNING   ############
# If you care about beautiful code, #
# please don't look below. This     #
# portion is hacky and ugly.        #
#####################################

# Option parsing
only_mode="false"
dot_cask="true"
dot_brew="true"
dot_zsh="true"
dot_git="true"
dot_macos="true"
dot_npm="true"
dot_gem="true"
dot_vscode="true"
dot_nvim="true"
dot_latex="false"

edit_options () {
  # Update mode
  if [[ $1 == "update" ]]; then
    dot_cask="false"
    dot_git="false"
    dot_zsh="false"
    dot_vscode="false"
  elif [[ $1 == "only" ]]; then
    only_mode="true"
    # The following line holds a *very* bad practice of injecting a string into a bash eval command without checking its contents.
    # Please don't use this in production environments.
    local cmd="welcome_routine; source \"./$2/main.sh\"; $2_routine \"true\""
    if [[ $2 == "brew" ]]; then cmd="$cmd \"true\""; fi
    eval $cmd
  else
    eval "dot_$1=\"$2\""
  fi
  return
}

while [[ $1 != "" ]]; do
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
    -o | --only )
      shift
      message "Installing only $1"
      edit_options "only" $1
      ;;
    -u | --update )
      message "Installing in update mode"
      edit_options "update"
      ;;
  esac
  shift
done

if [[ $only_mode != "true" ]]; then
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
fi


if [[ $only_mode != "true" ]]; then
  welcome_routine

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

  source "./latex/main.sh"
  latex_routine "$dot_latex"

  source "./nvim/main.sh"
  nvim_routine "$dot_nvim"

  title "Manual things left to do"
    message "1. Set up AWS credentials"
    message "2. Install Xcode"
  title_off
fi

script_finish
