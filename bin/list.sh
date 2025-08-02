# list.sh - Echoes the contents of the '.output' file.

content=$(cat "$DYNALIAS_OUT")

# check if the output file has content
[ -z "$content" ] && throw "output file has no content"

echo "$content"
