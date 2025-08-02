# set.sh - Reads the 'text' and 'func' directories, formats their contents into
# lines to update the 'output' file.
#
# Parameters:
#   $1 - Type of the alias (text or func)
#   $2 - Name of the alias

alias_path="$DYNALIAS_CONF/$1/$2"

. "$DYNALIAS_LIB/alias.sh"

if [ -n "$1" ]; then
    if [ "$1" != "text" ] && [ "$1" != "func" ]; then
        throw "unknown alias type; must be 'text' or 'func'"
    fi

    # check if the alias name is empty
    [ -z "$2" ] && throw "please provide an alias name"

    nano "$alias_path" \
    || vi "$alias_path" \
    || throw "it was not possible to open a text editor"

    # if the func alias was created, give it execution permission
    [ -f "$alias_path" ] && [ "$1" = "func" ] && chmod +x "$alias_path"
fi

# empties or creates the output file
true > "$DYNALIAS_OUT"

for dir in "$DYNALIAS_CONF"/*; do
    [ -f "$dir" ] && continue

    if [ -z "$(ls -A "$dir")" ]; then
        err "$dir is empty; can't create aliases from this directory"
        continue
    fi

    type="${dir#"$DYNALIAS_CONF"/}"

    echo "# $type" >> "$DYNALIAS_OUT"

    for file in "$dir"/*; do
        format_alias "$type" "$file" >> "$DYNALIAS_OUT"
    done

    echo "" >> "$DYNALIAS_OUT"
done
