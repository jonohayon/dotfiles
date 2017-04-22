sublime_routine () {
  title "Sublime Text 3 Configuration"
  	message "Configuring Sublime Text 3..."
    cp "./sublime/Preferences.sublime-settings" "$HOME/Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings"
    cp "./sublime/Package Control.sublime-settings" "$HOME/Library/Application Support/Sublime Text 3/Packages/User/Package Control.sublime-settings"
    ok "Configured Sublime Text 3!"

    message "Linking Sublime Text 3 executable..."
    ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" "$HOME/bin/subl"
    ok "Linked Sublime Text 3 executable!"
  title_off
}
