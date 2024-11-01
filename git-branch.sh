get_git_branch() {
    branch="`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`"
    if [[ "$branch" != "" ]]; then
        echo -n " ($branch)"
    fi
}

get_git_branch_color() {
    case "$PS1_GIT_COLOR" in
        black) echo 30;;
        red) echo 31;;
        green) echo 32;;
        yellow) echo 33;;
        blue) echo 34;;
        magenta) echo 35;;
        cyan) echo 36;;
        lightgray) echo 37;;
        gray) echo 90;;
        lightred) echo 91;;
        lightgreen) echo 92;;
        lightyellow) echo 93;;
        lightblue) echo 94;;
        lightmagenta) echo 95;;
        lightcyan) echo 96;;
        white) echo 97;;
        *) echo 31;;
    esac
}

if ! echo "$PS1" | grep -q 'get_git_branch'; then
    PS1_GIT='\[\033[01;$(get_git_branch_color)m\]$(get_git_branch)\[\033[00m\]'
    PS1="`echo "$PS1" | sed 's/\\\\\\$[[:space:]]*$//'`$PS1_GIT\\$ "
fi

