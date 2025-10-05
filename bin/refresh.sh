# refresh.sh - Formats '~/.config/dynalias' into lines for the 'output' file.

# empties or creates the output file
true > "$DYNALIAS_OUT"

for file in "$DYNALIAS_CONF"/.* "$DYNALIAS_CONF"/*; do
    [ "$file" = "$DYNALIAS_OUT" ] && continue

    if [ -z "$(cat "$file")" ]; then
        err "$file is empty; can't create aliases from this file"
        continue
    fi

    content="alias $(basename "$file")='. $file'"

    echo "$content" >> "$DYNALIAS_OUT"
done
