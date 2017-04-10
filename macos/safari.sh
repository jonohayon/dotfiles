configure_safari () {
  message "Configuring Safari..."
  # Set up Safari for development
  defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
  defaults write com.apple.Safari IncludeDevelopMenu -bool true
  defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
  defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true
  defaults write -g WebKitDeveloperExtras -bool true

  # Set Safari's homepage to about:blank
  defaults write com.apple.Safari HomePage -string "about:blank"
  ok "Configured Safari!"
}
