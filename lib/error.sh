# error.sh - Contains utilities related to error management.

# Description: Displays an error message and exits
# Parameters:
#   $1 - Error message
# Returns: Nothing
throw() {
    err "$1"
    exit 1
}
