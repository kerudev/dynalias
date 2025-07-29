# read.sh - Echoes the contents of the alias file
# Parameters:
#   $1 - Name of the alias

if [ -z "$1" ]; then
    throw "should pass an alias name to read from"
fi

. "$DYNALIAS_LIB/alias.sh"

content=$(get_alias_content "$1")

if [ -f "$content" ]; then
    cat "$content"; echo
else
    echo "$content"
fi
