BLUE='\e[0;34m'
YELLOW='\033[33m'
RED='\033[0;31m'
RESET='\033[0m'

log() {
    case "$1" in
        info) color=$BLUE ;;
        warn) color=$YELLOW ;;
        error) color=$RED ;;
    esac

    printf "$color%s:$RESET %s\n" "$1" "$2"
}

info() {
    log "info" "$1"
}

warn() {
    log "warn" "$1"
}

err() {
    log "error" "$1"
}
