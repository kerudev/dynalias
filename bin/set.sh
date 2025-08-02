# set.sh - Reads the '~/.config/dynalias' directory and formats its content
# into lines for the 'output' file.
#
# Parameters:
#   $1 - Name of the alias

# check if the alias name is empty
[ -z "$1" ] && throw "please provide an alias name"

alias_path="$DYNALIAS_CONF/$1"

# check if the alias exists
[ -f "$alias_path" ] && throw "alias '$1' already exists"

$EDITOR "$alias_path" \
|| nano "$alias_path" \
|| vi "$alias_path" \
|| throw "it was not possible to open a text editor"
