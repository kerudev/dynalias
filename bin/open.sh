# open.sh - Opens the alias file in a text editor
# Parameters:
#   $1 - Name of the alias

# check if a name was passed
[ -z "$1" ] && throw "should pass a name to open"

. "$DYNALIAS_LIB/alias.sh"

content=$(get_alias_content "$1")

if [ -z "$content" ] || expr "$content" : '.*error' >/dev/null; then
    throw "alias doesn't exist"
fi

if [ -f "$content" ]; then
    nano "$content"
else
    nano "$DYNALIAS_ALIAS/text/$1"
fi
