# alias.sh - Contains utilities related to alias management.

# Description: Reads a file, and extracts its name and contents to format the alias command.
# Parameters:
#   $1 - Type of alias
#   $2 - File to be processed
# Returns: Formatted alias command
format_alias() {
    if [ "$1" != "text" ] && [ "$1" != "func" ]; then
        throw "unknown type '$1'; can't create aliases from this folder"
    fi

    # obtains the alias name from the given path
    name="${2#*/"${1}"/}"

    echo "alias $name='. $2'"
}

# Description: Reads the contents of an existing alias.
# Parameters:
#   $1 - Name of the alias
# Returns: The alias' content or error message.
get_alias_content() {
    name="alias $1="
    line=$(grep "$name" "$DYNALIAS_OUT")

    # check if the alias name is known
    [ -z "$line" ] && throw "unknown alias name '$1'"

    content="${line#"$name'"}"
    content="${content%\'*}"

    # check if the alias has content
    [ -z "$content" ] && throw "alias exists but has no content"

    echo "$content"
}
