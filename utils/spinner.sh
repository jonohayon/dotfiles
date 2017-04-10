# A spinner for showing that something is processing
spin () {
  local pid=$1
  local message=$2

  local delay=0.05

  local frames=($'⠋' $'⠙' $'⠹' $'⠸' $'⠼' $'⠴' $'⠦' $'⠧' $'⠇' $'⠏') # Spinner frames array
  local t=9 # Hardcoded array length cuz why not really
  local i=0 # Index variable

  local pad=""
  for (( i = 0; i < $(tput cols); i++ )); do
    pad="\b$pad"
  done

  while [ "$(ps a | awk '{ print $1 }' | grep -w $pid)" ]; do
    local frame=${frames[i]}
    p_cyan " $(get_padding)[$frame] $message"
    [ $i -lt $t ] && i=$((i+1)) || i=0
    sleep $delay
    printf $pad # Just some extra padding
  done

  # Important - return the last process' return code
  wait $pid
  return $?
}
