set -x PATH /usr/local/cuda-12.3/bin $PATH
set -x LD_LIBRARY_PATH /usr/local/cuda-12.3/lib64 $LD_LIBRARY_PATH
set -x PATH $PATH $HOME/.cargo/bin/
set -x PATH $PATH $HOME/.local/depot_tools
if not string match -q -- $PATH "$HOME/.local/bin:$HOME/bin:"
    set -x PATH $HOME/.local/bin:$HOME/bin $PATH
end
