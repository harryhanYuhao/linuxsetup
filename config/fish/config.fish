# I use tide prompt
# fisher install IlanCosman/tide@v6 
# tide configure # for configuration
if status is-interactive
    # Commands to run in interactive sessions can go here
end

# history utils: better C-R
mcfly init fish | source
set -gx MCFLY_RESULTS 50
set -gx MCFLY_RESULTS_SORT LAST_RUN

set -x PATH /usr/local/cuda-12.3/bin $PATH
set -x LD_LIBRARY_PATH /usr/local/cuda-12.3/lib64 $LD_LIBRARY_PATH
set -x PATH $PATH $HOME/.cargo/bin/
set -x PATH $PATH $HOME/.local/depot_tools
if not string match -q -- $PATH "$HOME/.local/bin:$HOME/bin:"
    set -x PATH $HOME/.local/bin:$HOME/bin $PATH
end

set -U GTK_IM_MODULE fcitx
set -U QT_IM_MODULE fcitx
set -U SDL_IM_MODULE fcitx
set -U XMODIFIERS @im=fcitx

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

function mkcd_function
  mkdir -p $argv
  and cd $argv
end

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
alias mkcd mkcd_function

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
alias carc="cargo check"
alias carr="cargo run"

alias nvchad="NVIM_APPNAME=nvchad nvim"
alias lazyvim="NVIM_APPNAME=lazyvim nvim"

