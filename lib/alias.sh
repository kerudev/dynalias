# alias.sh - Contains utilities related to alias management.

# Description: Reads a file, and extracts its name and contents to format the alias command.
# Parameters:
#   $1 - Type of alias
#   $2 - File to be processed
# Returns: Formatted alias command
format_alias() {
    type=$1
    file=$2

    if [ "$type" = "text" ]; then
        code=$(cat "$file")
    elif [ "$type" = "func" ]; then
        code="$file"
    else
        throw "unknown type $type; can't create aliases from this folder"
    fi

    name="${file#*/"${type}"/}"

    echo "alias $name='$code'"
}

# Description: Reads the contents of an existing alias.
# Parameters:
#   $1 - Name of the alias
# Returns: The alias' content or error message.
get_alias_content() {
    expr="alias $1="
    line=$(grep "$expr" "$DYNALIAS_OUTPUT")

    if [ -z "$line" ]; then
        throw "unknown alias name"
    fi

    content="${line#"$expr'"}"
    content="${content%\'*}"

    if [ -z "$content" ]; then
        throw "alias exists but has no content"
    fi

    echo "$content"
}
