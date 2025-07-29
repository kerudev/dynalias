BLUE='\e[0;34m'
YELLOW='\033[33m'
RED='\033[0;31m'
RESET='\033[0m'

info() {
    printf "${BLUE}info:${RESET} %s\n" "$1"
}

warn() {
    printf "${YELLOW}warn:${RESET} %s\n" "$1"
}

err() {
    printf "${RED}error:${RESET} %s\n" "$1"
}
