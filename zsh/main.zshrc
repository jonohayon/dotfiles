##########
# .zshrc #
##########

# Prompt shit
setopt prompt_subst
autoload -U promptinit && promptinit
autoload -U colors && colors
autoload -U add-zsh-hook

source ~/.zshtheme # Source the prompt theme

# Include extended-glob (for excluding and stuff)
setopt extended_glob

source ~/.antigen/antigen.zsh # Load antigen

# Some recommended plugins
antigen bundles <<EOBUNDLES
  git
  zsh-users/zsh-syntax-highlighting
  zsh-users/zsh-completions
  denysdovhan/gitio-zsh
  voronkovich/gitignore.plugin.zsh
  chrissicool/zsh-256color
  node
  catimg
  nyan
  extract
  command-not-found
  heroku
  osx
EOBUNDLES

# Some Z hooks
antigen bundle rupa/z
add-zsh-hook precmd _z_precmd
function _z_precmd() {
  _z --add "$PWD"
}

antigen apply

# Initialize nvm
# export NVM_DIR="/Users/jonathano/.nvm"
# [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
# [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Initialize fnm
eval "$(fnm env --multi)"

# A simple calculator for the command line
function calc () { echo "$(($@))" }

# Base16 Colors
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
base16_bright

# Environment variables
export ZSH="$HOME/.antigen" # Set the home ZSH directory
export EDITOR="nvim"
export CODEDIR="$HOME/code" # Projects directory
export IDEA_HOME="/Applications/IntelliJ IDEA.app/Contents/"
export OPENCV_JNI_INCLUDE_DIR="$HOME/frc/code/opencv-android/sdk/native/jni/include"
export OPENCV_JNI_SDK_DIR="$HOME/frc/code/opencv-android/sdk/native/libs"
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig/" # Homebrew pkgconfig directory

##################
# Custom Aliases #
##################
alias pdir="cd $CODEDIR" # Cd to projects directory
alias nindex="node index.js" # Run index.js using nodejs
alias smocha="sudo mocha" # Run mocha tests (nodejs)
alias zshrc="source ~/.zshrc" # Update the zshrc
alias zshtheme="$EDITOR ~/.zshtheme" # Edit my theme
alias zshconfig="$EDITOR ~/.zshrc" # Edit the zshrc
alias sfa="standard-format -w ./*.js" # Formats all of the js files in . for standardjs
alias cls="clear" # Just cuz it's smaller, not cuz Windows
alias גב="cd" # When in hebrew mode, cd still works
alias בךקשר="clear" # When in hebrew mode, clear still works
alias st-mongo="mongod --dbpath ~/mongodb" # Start momgodb server easily
alias composer="php ~/composer.phar" # PHP Composer alias
alias ginit="git init && git add . && git commit -m \"🚀  Initial Commit\"" # Initialize an empty repository, add all of the files and commit them
alias tf-activate="source ~/tensorflow/bin/activate"
alias apy3="$HOME/anaconda3/bin/python" # Anaconda Python 3 installation
alias octoprint-start="source ~/code/OctoPrint/venv/bin/activate; octoprint serve"

# Linux aliases
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  alias telegram="nohup $TELEGRAM_HOME/Telegram &"
fi

# Theos SDK
export THEOS="$HOME/theos"

# PATH shit
if [[ "$OSTYPE" == "linux-gnu" ]]; then # Linux paths
  # Setting JAVA_HOME, ANDROID_HOME and PATH
  export JAVA_HOME="/usr/lib/jvm/java-8-oracle/"
  export ANDROID_HOME="/home/rezozo/Android/Sdk"
  export STUDIO_HOME="~/android-studio"
  export ANDROID_EMULATOR_FORCE_32BIT="true"
  export PATH="$ANDROID_HOME/tools:$PATH"
  export PATH="$ANDROID_HOME/platform-tools:$PATH"
  export PATH="$STUDIO_HOME/bin:$PATH"

  # PhantomJS
  export PHANTOM_HOME="~/phantomjs-2.1.1-linux-i686/"
  export PATH="$PHANTOM_HOME/bin:$PATH"

  # apktool
  export APKTOOL_HOME="~/apktool"
  export PATH="$APKTOOL_HOME:$PATH"

  # jadx
  export JADX_HOME="~/jadx/bin/"
  export PATH="$JADX_HOME:$PATH"

  # dex2jar
  export D2J_HOME="~/dex2jar"
  export PATH="$D2J_HOME:$PATH"

  # jd-ui
  export JDUI_HOME="~/jd-ui"
  export PATH="$JDUI_HOME:$PATH"

  # NW.js
  export NWJS_HOME="~/nwjs"
  export PATH="$NWJS_HOME:$PATH"

  # Popcorn Time
  export POPCORN_HOME="~/popcorn"
  export PATH="$POPCORN_HOME:$PATH"

  # WebTorrent Desktop
  export WEBTORRENT_HOME="~/webtorrent"
  export PATH="$WEBTORRENT_HOME:$PATH"

  # Swift
  export SWIFT_HOME="~/swift/usr/bin"
  export PATH="$SWIFT_HOME:$PATH"

  # Telegram
  export TELEGRAM_HOME="~/telegram/Telegram"
  export PATH="$TELEGRAM_HOME:$PATH"

  # Prepros
  export PREPROS_HOME="~/prepros"
  export PATH="$PREPROS_HOME:$PATH"

  # Electron
  export ELECTRON_LINUX_HOME="~/electron"
  export PATH="$ELECTRON_LINUX_HOME:$PATH"
elif [[ "$(uname)" == "Darwin" ]]; then # macOS exports
  export JAVA_HOME=$(/usr/libexec/java_home)
fi

# Add fzf to the path
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Add the haskell stack folder to the path
export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/opt/qt/bin:$PATH"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add flutter to the path
export PATH="$HOME/flutter/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
