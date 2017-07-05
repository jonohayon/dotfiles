install_culmus_latex () {
  # Step 1 - download culmus-latex
  wget -O "$HOME/culmus-latex.tar" https://downloads.sourceforge.net/project/ivritex/culmus-latex/culmus-latex-0.7/culmus-latex-0.7-r1.tar.gz &> /dev/null &
  spin $! "Downloading culmus-latex..."
  [ $? -eq 0 ] \
    && ok "Downloaded culmus-latex!    " \
    || error "Couldn't download culmus-latex"

  # Step 2 - untarball and cd to it
  tar xvf "$HOME/culmus-latex.tar"
  cd "$HOME/culmus-latex"

  # Step 3 - configure it
  sudo make TEXMFDIR="/usr/local/texlive/texmf-local/" &> /dev/null &
  spin $! "Configuring culmus-latex..."
  [ $? -eq 0 ] \
    && ok "Configured culmus-latex!    " \
    || error "Couldn't configure culmus-latex"

  # Step 4 - install it
  sudo make TEXMFDIR="/usr/local/texlive/texmf-local/" install &> /dev/null &
  spin $! "Installing culmus-latex..."
  [ $? -eq 0 ] \
    && ok "Installed culmus-latex!    " \
    || error "Couldn't install culmus-latex"

  # Return to homebase
  cd "$HOME/dotfiles"
}

latex_routine () {
  local ilatex=$1

  if [[ $ilatex == "true" ]]; then
    title "LaTeX"
      message "Installing mactex..."
      install_cask_formula "mactex"

      message "Installing lyx..."
      install_cask_formula "lyx"

      message "Installing culmus-latex (for Hebrew support)..."
      install_culmus_latex
    title_off
  fi
}
