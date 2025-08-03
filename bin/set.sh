# set.sh - Creates a new alias given a certain name.
#
# Parameters:
#   $1 - Name of the alias

# check if the alias name is empty
[ -z "$1" ] && throw "please provide an alias name to set"

alias_path="$DYNALIAS_CONF/$1"

# check if the alias exists
[ -f "$alias_path" ] && throw "alias '$1' already exists"

$EDITOR "$alias_path" \
|| nano "$alias_path" \
|| vi "$alias_path" \
|| throw "it was not possible to open a text editor"

info "'$1' created successfully"

. "$DYNALIAS_BIN/refresh.sh"
