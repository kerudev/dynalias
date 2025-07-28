#!/bin/bash

# set.sh - Reads the alias files and formats them into lines to update the output file.
# Parameters:
#   $1 - Type of alias (text or func)
#   $2 - Name of alias

source "$DYNALIAS_LIB/alias.sh"
source "$DYNALIAS_LIB/output.sh"

if [[ -n "$1" ]]; then
    if [[ "$1" != "text" && "$1" != "func" ]]; then
        err 1 "unknown alias type; must be 'text' or 'func'"
    fi

    if [[ -z "$2" ]]; then
        err 1 "please provide an alias name"
    fi

    alias_path="$DYNALIAS_ALIAS/$1/$2"
    nano "$alias_path" || vi "$alias_path" || throw "it was not possible to open a text editor"
    chmod +x "$alias_path"
fi

check_output

for dir in "$DYNALIAS_ALIAS"/*; do
    if [[ -z "$(ls -A "$dir")" ]]; then
        err 0 "$dir is empty; can't create aliases from this directory"
        continue
    fi

    type="${dir#"$DYNALIAS_ALIAS"/}"

    write_output "# $type"

    for file in "$dir"/*; do  
        write_output "$(format_alias "$type" "$file")"
    done

    write_output ""
done
