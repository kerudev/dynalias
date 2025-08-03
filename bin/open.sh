# open.sh - Opens the alias file in a text editor.
#
# Parameters:
#   $1 - Name of the alias

# check if a name was passed
[ -z "$1" ] && throw "please provide an alias name to open"

# check if content didn't error and it's not empty
[ ! -f "$DYNALIAS_CONF/$1" ] && throw "alias '$1' doesn't exist"

nano "$DYNALIAS_CONF/$1"
