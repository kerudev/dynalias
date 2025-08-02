# init.sh - Creates the folder structure where dynalias will look for the
# aliases and the output file.

if [ ! -d "$DYNALIAS" ]; then
    mkdir -p "$DYNALIAS_TEXT" "$DYNALIAS_FUNC"
    touch "$DYNALIAS_OUT"
fi

line="[ -f \"$DYNALIAS_OUT\" ] && . \"$DYNALIAS_OUT\""

# add line in .bash_aliases if not present or file doesn't exist
! grep -sqF "$line" ~/.bash_aliases && echo "$line" >> ~/.bash_aliases
