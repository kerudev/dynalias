# open.sh - Opens the alias file in a text editor.
#
# Parameters:
#   $1 - Name of the alias

# check if a name was passed
[ -z "$1" ] && throw "should pass a name to open"

. "$DYNALIAS_LIB/alias.sh"

content=$(get_alias_content "$1")

# check if content didn't error and it's not empty
if [ "$?" = 1 ] || [ -z "$content" ]; then
    throw "alias '$1' doesn't exist"
fi

# choose the path to open
[ -f "$content" ] && path="$content" || path="$DYNALIAS_TEXT/$1"

nano "$path"
