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

pyvenv_function () {
	if [ -d .venv ]; then
		echo "Activating virtual environment"
		source .venv/bin/activate
	else	
		echo "Creating virtual environment"
		python3 -m venv .venv
		echo "Creating virtual environment"
		source .venv/bin/activate
	fi
}
alias pyvenv=pyvenv_function

alias c="clear"
alias git-init="git init; echo -e '*.out\n*.o\n*.txt' >> .gitignore"
alias ls="eza"
alias ll="eza -stime -l"
alias cwall="bash ~/.bashrc.cmd.d/changeWallpaper.sh"
alias v="NVIM_APPNAME=mynvimconfig nvim"
alias py="python3"
alias vpnuoe="sudo openfortivpn remote.net.ed.ac.uk:8443 -u s2162783"
alias gaa="git add --all"
alias gcm="git commit -m"
alias carc="cargo check"
alias carr="cargo run"

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias nvchad="NVIM_APPNAME=nvchad nvim"
alias lazyvim="NVIM_APPNAME=lazyvim nvim"
