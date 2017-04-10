source "./macos/safari.sh"
source "./macos/utils.sh"
source "./macos/finder.sh"

macos_routine () {
  title "macOS Configuration"
    configure_safari
    configure_finder
    configure_utilities
  title_off
}
