# read.sh - Echoes the contents of the alias file.
#
# Parameters:
#   $1 - Name of the alias

# checks if the alias name was provided
[ -z "$1" ] && throw "should pass an alias name to read from"

file="$DYNALIAS_CONF/$1"

# check if the file exists
[ ! -f "$file" ] && throw "alias '$1' doesn't exist"

# cat the file and print a newline if the file doesn't end with one
cat "$file" && [ -n "$(tail -c1 "$file")" ] && echo
