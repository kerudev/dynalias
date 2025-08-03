# help.sh - Displays the help message of dynalias.

cat << EOF
Description:
  Manages dynamic aliases to simplify shell commands.

Usage:
  dynalias COMMAND [...ARGS]

Commands:
  help          Displays this help message.
  set  <name>   Creates a new alias file.
  open <name>   Opens the alias file in a text editor.
  read <name>   Reads the contents of an alias and displays it.
  rm   <name>   Removes an alias.
  list          Shows the lines of the '.output' file.
  refresh       Updates the '.output' file.
EOF
