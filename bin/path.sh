# path.sh - Returns the path of an alias.
#
# Parameters:
#   $1 - Name of the alias

# checks if the alias name was provided
[ -z "$1" ] && throw "please provide an alias name to get its path"

# check if the alias exists
[ ! -f "$DYNALIAS_CONF/$1" ] && throw "'$1' doesn't exist on the output file"

path=$(sed -n "s/^alias $1='\\. \(.*\)'/\1/p" "$DYNALIAS_OUT")

[ -z "$path" ] && throw "'$1' doesn't exist on the output file"

echo "$path"
