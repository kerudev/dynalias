# dynalias

`dynalias` is a POSIX compliant script designed to simplify alias management.

To achieve this, aliases are stored in files, which contain code that is
executed when the alias is called.

## Setup

First, install the project on your home directory:

```sh
git clone https://github.com/kerudev/dynalias.git ~/.dynalias
```

Then, paste the following on `~/.bashrc`:

```sh
alias dynalias="~/.dynalias/dynalias.sh"
# dynalias refresh	# uncomment to update aliases when opening console

# This should exist by default. If not, paste the whole thing
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
```

## How to use

`dynalias` uses two core directories:
- `~/.dynalias`: contains the project's scripts.
- `~/.config/dynalias`: contains the `alias files` and the `.output` file.

Then run `dynalias set <name>` to create an alias, which can't contain function
declarations because alias files are sourced, meaning they are read line by
line and writing a function will result in a syntax error.

An example of a simple alias:

```sh
# ~/.config/dynalias/add
git add .
```

The alias will be stored like this:

```sh
# .output
alias add='. ~/.config/dynalias/add'
```

After running `.dynalias`, you can use:

```sh
$ add   # This executes 'git add .'
```

Aliases can take arguments too:

```sh
# ~/.config/dynalias/commit
if [[ -z $1 ]]; then
    echo "Missing commit message"
    exit 1
fi

git commit -m "$1"
```

The alias will be stored like this:

```sh
# .output
alias commit='~/.config/dynalias/commit'
```

After running `.dynalias`, you can use:

```sh
$ commit "..."          # This executes 'git commit -m "..."'

$ commit                # This prints a message and exits with 1
Missing commit message
```
