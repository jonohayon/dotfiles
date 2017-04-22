#!/usr/bin/env bash

source "./utils/main.sh" # Importing the utilities

message "Configuration update script"

title "Sublime Text 3"
  SUBL_PATH="$HOME/Library/Application Support/Sublime Text 3/Packages/User"

  message "Updating Sublime prefrences..."
  cp "$SUBL_PATH/Preferences.sublime-settings" "./sublime/Preferences.sublime-settings"
  ok "Updated Sublime prefrences!"

  message "Updating Package Control prefrences..."
  cp "$SUBL_PATH/Package Control.sublime-settings" "./sublime/Package Control.sublime-settings"
  ok "Updated Pckage Control prefrences!"
title_off

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
