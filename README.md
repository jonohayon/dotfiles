Dotfiles
===
It's time for me to create some dotfiles, isn't it?

*Disclaimer - these dotfiles are fully supported only in macOS at the moment, but I'm trying to add partial support for linux.*

## What it includes:
 - Neovim configuration
 - iTerm configuration
 - LaTeX install scripts (for macOS and soon Linux)
 - Sublime Text 3 configuration
 - ZSH prompt
 - Global `npm` modules + `brew` packages
 - Apps and fonts from `brew cask`

## What it doesn't include:
 - Coffee making programs
 - All of the manual stuff
 - ZSH installation
 - And more!

## Installation
```bash
# First, make sure to have xcode command line tools installed
xcode-select --install

# Clone the repo
git clone https://github.com/jonohayon/dotfiles ~/dotfiles

# Run the install script!
cd ~/dotfiles && ./install.sh
```

## Screenshots
Terminal: ![alt text][terminal]
Neovim (w/vimR): ![alt text][vimr]

[terminal]: https://puu.sh/wXL2I/dc3d99a4d7.png "Terminal Screenshot"
[vimr]: https://puu.sh/wXL8H/c85908f355.png "vimR Screenshot"
