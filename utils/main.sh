# Main utilities file
source ./utils/messages.sh # Source message utilities file
source ./utils/questions.sh # Source question utilities file
source ./utils/spinner.sh # Source spinner utilities file

# Sodmo is da king! https://github.com/yardnsm/dotfiles/blob/master/_setup/utils/commands.sh#L8
cmd_exists () {
  command -v "$1" &> /dev/null
  echo $?
}
