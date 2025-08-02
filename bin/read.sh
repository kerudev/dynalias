# read.sh - Echoes the contents of the alias file.
#
# Parameters:
#   $1 - Name of the alias

# checks if the alias name was provided
[ -z "$1" ] && throw "should pass an alias name to read from"

. "$DYNALIAS_LIB/alias.sh"

content=$(get_alias_content "$1")

# if the alias is a file (func), cat the file
[ -f "$content" ] && { cat "$content"; echo; } || echo "$content"
