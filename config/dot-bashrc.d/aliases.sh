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

alias c="clear"
alias git-init="git init; echo -e '*.out\n*.o\n*.txt' >> .gitignore"
alias ls="exa"
alias ll="exa -stime -l"
alias cwall="bash ~/.bashrc.cmd.d/changeWallpaper.sh"
alias v="nvim"
alias pyvenv="source .venv/bin/activate"
alias py="python3"
alias vpnuoe="sudo openfortivpn remote.net.ed.ac.uk:8443 -u s2162783"

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
