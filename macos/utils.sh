configure_utilities () {
  message "Configuring some more macOS utilities..."
  defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1 # Use AirDrop with every interface
  defaults write com.apple.LaunchServices LSQuarantine -bool false # Disable the “Are you sure you want to open this application?” dialog
  defaults write com.apple.mail DisableInlineAttachmentViewing -bool true # Disable inline attachments in Mail.app (just show the icons)
  defaults write com.apple.terminal StringEncodings -array 4 # Only use UTF-8 in Terminal.app
  defaults write com.apple.terminal ShowTabBar -bool true # Show the tab bar
  defaults write com.apple.terminal ShowTabBarInFullScreen -bool true # Show the tab bar in fullscreen
  defaults write com.apple.dock show-process-indicators -bool true # Show indicator lights for open applications in the Dock
  defaults write com.apple.dock autohide -bool true # Automatically hide and show the Dock
  defaults write com.apple.dock magnification -bool true # Enable magnification
  defaults write com.apple.dock minimize-to-application -bool true # Minimize windows to application icon
  defaults write com.apple.dock tilesize -integer 59 # Set the tile size to 59
  ok "Configured all of the utilities!"
}
