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

# Load nvm as you need it
function load_nvm () {
  local nvm_dir="$HOME/.nvm"
  [ -s "$nvm_dir/nvm.sh" ] && . "$nvm_dir/nvm.sh"
}


# A simple calculator for the command line
function calc () { echo "$(($@))" }

# Base16 Colors
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
base16_bright

export ZSH="$HOME/.antigen" # Set the home ZSH directory
export EDITOR='vimr' # Just cuz it's faster than nvim in iTerm tbh
export CODEDIR="$HOME/code" # Projects directory

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
alias ginit="git init && git add . && git commit -m \"🚀  Initial Commit\"" # Initialize an empty repository, add all of the files and commit them

# Add fzf to the path
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Zsh vi mode
bindkey -v
bindkey "^?" backward-delete-char
export KEYTIMEOUT=1

function zle_keymap_select {
  build_prompt
  zle && zle reset-prompt
}

zle -N zle_keymap_select
