alias c="clear"

mkcd () {
  case "$1" in
    */..|*/../) cd -- "$1";; # that doesn't make any sense unless the directory already exists
    /*/../*) (cd "${1%/../*}/.." && mkdir -p "./${1##*/../}") && cd -- "$1";;
    /*) mkdir -p "$1" && cd "$1";;
    */../*) (cd "./${1%/../*}/.." && mkdir -p "./${1##*/../}") && cd "./$1";;
    ../*) (cd .. && mkdir -p "${1#.}") && cd "$1";;
    *) mkdir -p "./$1" && cd "./$1";;
  esac
}

alias git-init="git init; echo -e '*.out\n*.o\n*.txt' >> .gitignore"

alias ls=exa
alias ll="exa -stime -l"
alias cwall="bash ~/.bashrc.cmd.d/changeWallpaper.sh"
