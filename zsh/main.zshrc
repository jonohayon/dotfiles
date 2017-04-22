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

antigen use oh-my-zsh # Add Oh My ZSH

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
export NVM_DIR="/Users/jonathano/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Commented because I don't use nvm at the moment
# # Some nvm hooks
# function load-nvmrc() {
#   if [[ -f .nvmrc && -r .nvmrc ]]; then
#     if [[ $(nvm ls | grep `cat ./.nvmrc`) != "" ]]; then
#       nvm use
#     else
#       echo "Node version $(cat ./.nvmrc) wasn't found; Installing..."
#       nvm install $(cat ./.nvmrc); nvm use
#     fi
#   elif [[ $(nvm version) != $(nvm version default)  ]]; then
#     nvm use default
#   fi
# }
# add-zsh-hook chpwd load-nvmrc
# load-nvmrc

# A simple calculator for the command line
function calc () { echo "$(($@))" }

# Base16 Colors
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
base16_bright

export ZSH="$HOME/.antigen" # Set the home ZSH directory

# Prefered editor
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR="nano"
else
  export EDITOR="subl"
fi

export PROJECTS="$HOME/Desktop/Projects" # Projects directory

# Tiny Care Terminal configuration
export TTC_REPOS="~/dotfiles,~/Desktop/Projects"
export TTC_WEATHER="Tel Aviv"
export TTC_CELSIUS=true

##################
# Custom Aliases #
##################
alias pdir="cd $PROJECTS" # Cd to projects directory
alias nindex="node index.js" # Run index.js using nodejs
alias smocha="sudo mocha" # Run mocha tests (nodejs)
alias zshrc="source ~/.zshrc" # Update the zshrc
alias zshtheme="$EDITOR ~/.zshtheme" # Edit my theme
alias zshconfig="$EDITOR ~/.zshrc" # Edit the zshrc
alias sfa="standard-format -w ./*.js" # Formats all of the js files in . for standardjs
alias npmprivate="npm config set registry http://repo.dev.wix/artifactory/api/npm/npm-repos" # Wix private npm
alias npmpublic="npm config set registry https://registry.npmjs.org/" # Set public npm back
alias cls="clear" # Just cuz it's smaller, not cuz Windows
alias גב="cd" # When in hebrew mode, cd still works
alias בךקשר="clear" # When in hebrew mode, clear still works
alias zshconfig="subl ~/.zshrc" # Edit .zshrc easily
alias st-mongo="mongod --dbpath ~/mongodb" # Start momgodb server easily
alias composer="php ~/composer.phar" # PHP Composer alias
alias ginit="git init && git add . && git commit -m \"🚀  Initial Commit\"" # Initialize an empty repository, add all of the files and commit them

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
fi

# export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
