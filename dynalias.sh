#!/usr/bin/env bash

# global exports
export DYNALIAS_ROOT="$HOME/.dynalias"
export DYNALIAS_BIN="$DYNALIAS_ROOT/bin"
export DYNALIAS_LIB="$DYNALIAS_ROOT/lib"

export DYNALIAS_CONF="$HOME/.config/dynalias"
export DYNALIAS_OUT="$DYNALIAS_CONF/.output"

# global imports
. "$DYNALIAS_LIB/error.sh"
. "$DYNALIAS_LIB/log.sh"

if [ -z "$1" ]; then
    err "Please provide a flag."
    err "Try 'dynalias help' for more information."
    exit 1
fi

if [ ! -d "$DYNALIAS_ROOT" ]; then
    err "The '.dynalias' folder doesn't exist on '\$HOME'."
    err "Please make sure to install the project correctly"
    exit 1
fi

if [ ! -d "$DYNALIAS_CONF" ]; then
    warn "Crating 'dynalias' inside '\$HOME/.config'."
    mkdir -p "$DYNALIAS_CONF"
fi

# save the passed command and shift arguments
command=$1
shift

# check if command exists
[ ! -f "$DYNALIAS_BIN/$command.sh" ] \
  && throw "unknown command '$command', use 'dynalias help'"

. "$DYNALIAS_BIN/$command.sh"
