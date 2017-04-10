configure_finder () {
  message "Configuring Finder..."
  chflags nohidden ~/Library # Show the ~/Library folder.
  # Set the Finder prefs for showing a few different volumes on the Desktop.
  defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
  defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
  # Show hidden files and file extensions by default
  defaults write com.apple.finder AppleShowAllFiles -bool true
  defaults write NSGlobalDomain AppleShowAllExtensions -bool true
  # Disable the warning when changing file extensions
  defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
  # Allow text-selection in Quick Look
  defaults write com.apple.finder QLEnableTextSelection -bool true
  # Enable auto-correct
  defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool true
  # Expand print panel by default
  defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
  # Expand save panel by default
  defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
  ok "Configured Finder!"
}
