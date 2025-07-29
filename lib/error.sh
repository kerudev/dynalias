# error.sh - Contains utilities related to error management.

. "$DYNALIAS_LIB/log.sh"

# Description: Displays an error message and exits
# Parameters:
#   $1 - Error message
# Returns: Nothing
throw() {
    err "$1"
    exit 1
}
