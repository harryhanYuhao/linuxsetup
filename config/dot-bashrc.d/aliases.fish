#function mkcd
#    switch "$argv[1]"
#        case */..|*/../
#            cd -- "$argv[1]"
#        case '/*/../*'
#            set dir (dirname "$argv[1]"); cd "$dir/../" && mkdir -p "./(basename "$argv[1]" | sed 's|..\/||')" && cd -- "$argv[1]"
#        case '/*'
#            mkdir -p "$argv[1]"; cd "$argv[1]"
#        case '*/../*'
#            set dir (dirname "$argv[1]"); cd "$dir/../" && mkdir -p "./(basename "$argv[1]" | sed 's|..\/||')" && cd "./$argv[1]"
#        case '../*'
#            cd ..; mkdir -p (echo "$argv[1]" | sed 's|^..\/||') && cd "$argv[1]"
#        case '*'
#            mkdir -p "./$argv[1]"; cd "./$argv[1]"
#    end
#end

function pyvenv_function
    if test -d .venv
        echo "Activating virtual environment"
        source .venv/bin/activate.fish
    else
        echo "Creating virtual environment"
        python3 -m venv .venv
        echo "Activating virtual environment"
        source .venv/bin/activate.fish
    end
end
alias pyvenv pyvenv_function

alias c="clear"
alias git-init="git init; echo -e '*.out\n*.o\n*.txt' >> .gitignore"
alias ls="exa"
alias ll="exa -stime -l"
alias cwall="bash ~/.bashrc.cmd.d/changeWallpaper.sh"
alias v="NVIM_APPNAME=mynvimconfig nvim"
alias py="python3"
alias vpnuoe="sudo openfortivpn remote.net.ed.ac.uk:8443 -u s2162783"
alias gaa="git add --all"
alias gcm="git commit -m"

alias nvchad="NVIM_APPNAME=nvchad nvim"
alias lazyvim="NVIM_APPNAME=lazyvim nvim"

