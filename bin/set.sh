# set.sh - Reads the alias files and formats them into lines to update the output file.
# Parameters:
#   $1 - Type of alias (text or func)
#   $2 - Name of alias

. "$DYNALIAS_LIB/log.sh"
. "$DYNALIAS_LIB/alias.sh"
. "$DYNALIAS_LIB/output.sh"

if [ -n "$1" ]; then
    if [ "$1" != "text" ] && [ "$1" != "func" ]; then
        throw "unknown alias type; must be 'text' or 'func'"
    fi

    # check if the alias name is empty
    [ -z "$2" ] && throw "please provide an alias name"

    alias_path="$DYNALIAS_ALIAS/$1/$2"
    nano "$alias_path" \
    || vi "$alias_path" \
    || throw "it was not possible to open a text editor"

    # if the file was created, give it execution permission
    [ -f "$alias_path" ] && chmod +x "$alias_path"
fi

# empties or creates the output file
true > "$DYNALIAS_OUTPUT"

for dir in "$DYNALIAS_ALIAS"/*; do
    if [ -z "$(ls -A "$dir")" ]; then
        err "$dir is empty; can't create aliases from this directory"
        continue
    fi

    type="${dir#"$DYNALIAS_ALIAS"/}"

    write_output "# $type"

    for file in "$dir"/*; do  
        write_output "$(format_alias "$type" "$file")"
    done

    write_output ""
done
