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

alias git-init="git init; echo -e '*.latexmk\n*.aux\n*.log\n*.gz\n*.toc\n*.bbl\n*.bcf\n*.xml\n*.blg\n*.fls\n*.out\n*.o\n*.txt' >> .gitignore"
