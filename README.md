# dynalias

`dynalias` is a collection of POSIX compliant scripts designed to simplify
alias management.

To achieve this, aliases are stored in files, which contain code that is
executed when the alias is called.

## Setup

`dynalias` uses two directories:
- `~/.dynalias`: contains the project's scripts.
- `~/.config/dynalias`: contains the `alias files` and the `.output` file
  (created and updated automatically).

First, clone the project on `~/.dynalias`:

```sh
git clone https://github.com/kerudev/dynalias.git ~/.dynalias
```

Then, paste the following on you shell's rc file:

```sh
alias dynalias="~/.dynalias/dynalias.sh"
# dynalias refresh	# uncomment to update aliases when opening console

# this line is optional, just for convenience to source your aliases later
export DYNALIAS_OUT="$HOME/.config/dynalias/.output"

if [ -f "$DYNALIAS_OUT" ]; then
    . "$DYNALIAS_OUT"
fi
```

## How to use

Run `dynalias set <name>` to create an alias, which can't contain function
declarations because alias files are sourced, meaning they are read line by
line and writing a function will result in a syntax error.

After creating an alias, you need to source the output file to refresh your
current session's aliases by running `. "$DYNALIAS_OUT"`.

You can also run `dynalias help` to get the full list of available commands.

## Examples

A simple alias that just runs `git add .`:

```sh
# This will create the 'add' file using $EDITOR
$ dynalias set add

# ~/.config/dynalias/add
git add .

# The alias will be stored like this on .output
alias add='. ~/.config/dynalias/add'
```

After running `. "$DYNALIAS_OUT"`:

```sh
$ add   # This executes 'git add .'
```

Aliases can be more complex and take arguments too:

```sh
# This will create the 'commit' file using $EDITOR
$ dynalias set commit

# ~/.config/dynalias/commit
if [[ -z $1 ]]; then
    echo "Missing commit message"
    exit 1
fi

git commit -m "$1"

# The alias will be stored like this on .output
alias commit='~/.config/dynalias/commit'
```

After running `. "$DYNALIAS_OUT"`:

```sh
$ commit "..."          # This executes 'git commit -m "..."'

$ commit                # This prints a message and exits with 1
Missing commit message
```
