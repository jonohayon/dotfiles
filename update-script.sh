#!/usr/bin/env bash

source "./utils/main.sh" # Importing the utilities

message "Configuration update script"

title "ZSH"
  message "Updating zshrc..."
  cp "$HOME/.zshrc" "./zsh/main.zshrc"
  ok "Updated zshrc!"

  message "Updating zstheme..."
  cp "$HOME/.zshtheme" "./zsh/main.zshtheme"
  ok "Updated zshtheme!"
title_off

title "nvim"
  message "Updating nvim configuration..."
  cp "$HOME/.config/nvim/init.vim" "./nvim/init.vim"
  ok "Updated nvim configuration!"
title_off

echo ""
ok "Finished updating the configurations!"
