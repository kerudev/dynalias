# help.sh - Displays the help message of dynalias.

cat << EOF
Description:
  Manages dynamic aliases to simplify shell commands.

Usage:
  dynalias COMMAND [...ARGS]

Commands:
  help                Displays this help message.

  init                Initializes the 'dynalias' directory structure.

  list                Shows the lines of the 'output' file.

  open <name>         Opens the alias file in a text editor.

  read <name>         Reads the contents of an alias and displays it.

  set  <type> <name>  If a type is passed, creates a new alias and updates the
                      'output' file.
                      If not, just updates the 'output' file.
EOF
