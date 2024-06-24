export PATH=/usr/local/cuda-12.3/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-12.3/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
export PATH="$PATH:$HOME/.cargo/bin/"
export PATH="$PATH:$HOME/.local/depot_tools"
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    export PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

