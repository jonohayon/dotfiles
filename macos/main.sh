source "./macos/safari.sh"
source "./macos/utils.sh"
source "./macos/finder.sh"

macos_routine () {
  local imacos=$1
  if [[ "$imacos" == "true" ]]; then
    title "macOS Configuration"
      configure_safari
      configure_finder
      configure_utilities
    title_off
  fi
}
