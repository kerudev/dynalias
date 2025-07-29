# output.sh - Contains utilities related to file management.

# Description: Writes content into a file.
# Parameters:
#   $1 - Content to be written
# Returns: Nothing
write_output() {
    echo "$1" >> "$DYNALIAS_OUTPUT"
}
