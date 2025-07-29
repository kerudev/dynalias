#!/bin/sh

if [ -z "$1" ]; then
    echo "Please provide a flag."
    echo "Try 'dynalias --help' for more information."
    exit 1
fi
    
if [ ! -d "$HOME/dynalias" ]; then
    echo "The 'dynalias' folder is not created. Use 'dynalias --init' to create it."
    echo "Try 'dynalias --help' for more information."
    exit 1
fi

if [ "$1" = "-i" ] || [ "$1" = "--init" ]; then
    . "$DYNALIAS_ROOT/bin/init.sh"
    exit 0
fi

export DYNALIAS_HOME="$HOME/dynalias"

export DYNALIAS_ALIAS="$DYNALIAS_HOME/alias"
export DYNALIAS_OUTPUT="$DYNALIAS_HOME/output"

export DYNALIAS_BIN="$DYNALIAS_ROOT/bin"
export DYNALIAS_LIB="$DYNALIAS_ROOT/lib"

. "$DYNALIAS_LIB/error.sh"

case "$1" in
    -h|--help)
        . "$DYNALIAS_BIN/help.sh"
        ;;

    -l|--list)
        . "$DYNALIAS_BIN/list.sh"
        ;;

    -s|--set)
        shift
        . "$DYNALIAS_BIN/set.sh"
        ;;

    -r|--read)
        shift
        . "$DYNALIAS_BIN/read.sh"
        ;;

    -o|--open)
        shift
        . "$DYNALIAS_BIN/open.sh"
        ;;

    *)
        throw "unknown command $1, use -h or --help"
        ;;
esac
