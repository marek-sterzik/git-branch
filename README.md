# git-branch

`git-branch` is a simple utility displaying the current branch in a bash prompt.


Pro zvýšení přehlednosti je vhodné nechat bash automaticky zobrazovat aktuální větev projektu.

## Installation

### Quick way

Just call:
```
curl -sS https://raw.githubusercontent.com/marek-sterzik/git-branch/refs/heads/main/git-branch-installer.sh | bash
```

### Manual way

Download file [git-branch.sh](git-branch.sh) and add it to your `.bashrc` manually.

Alternatively you may also configure the color of the prompted branch in your .bashrc by setting
the environment variable `PS1_GIT_COLOR`:

```bash
 export PS1_GIT_COLOR="lightyellow"
```

To see the list of available colors, see the [source code](git-branch.sh)


