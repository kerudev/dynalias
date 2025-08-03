# rm.sh - Removes an alias.
#
# Parameters:
#   $1 - Name of the alias

# checks if the alias name was provided
[ -z "$1" ] && throw "please provide an alias name to remove"

# check if the alias exists
[ ! -f "$DYNALIAS_CONF/$1" ] && throw "alias '$1' doesn't exist"

rm "$DYNALIAS_CONF/$1"
info "'$1' removed successfully"

. "$DYNALIAS_BIN/refresh.sh"
