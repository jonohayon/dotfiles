Dotfiles
===
It's time for me to create some dotfiles, isn't it?

*Disclaimer - these dotfiles are supported only in macOS at the moment. Sorry linux people*

##What it includes:
 - Sublime Text 3 configuration
 - ZSH prompt
 - Global `npm` modules + `brew` packages
 - Apps and fonts from `brew cask`
 - And more!

##What it doesn't include:
 - Coffee making programs
 - All of the manual stuff
 - ZSH installation
 - And more!

##Installation
```bash
# First, make sure to have xcode command line tools installed
xcode-select --install

# Clone the repo
git clone https://github.com/jonohayon/dotfiles ~/dotfiles

# IMPORTANT - Make sure you are using ZSH as your shell!
chsh -s $(which zsh)

# Run the install script!
cd ~/dotfiles && ./install.sh
```
