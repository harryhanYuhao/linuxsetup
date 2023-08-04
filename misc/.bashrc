# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

if [ -f ~/.bash_path ]; then
	. ~/.bash_path
fi

color_prompt=yes

# note \ in bash is like `\` in C preprossesor: it ignores the linebreak
# \u is username
# \h is hostname
# \w is current working directory
# \d, \t is date and time 
# \n is new line
# \$ is the $ prompt
if [ ! -z "$PS1" ]; then
  if [ "$color_prompt" = yes ]; then
    PS1="\
\[\033[01;32m\]\u@\h\[\033[00m\]\
:\
\[\033[01;34m\]\w\[\033[00m\]\
:\033[02m\d \t\033[00m\n\$ "
  else
    PS1='\u@\h:\w:\d \t\n\$ '
  fi
fi

# PS1='\u@\h:\w\$\n'

unset color_prompt force_color_prompt

. "$HOME/.cargo/env"
PATH=$PATH:~/psu/bin/tex

[ -f "/home/hhyh/.ghcup/env" ] && source "/home/hhyh/.ghcup/env" # ghcup-env

# graavl 

export PATH=$PATH:/home/hhyh/.graalvm-jdk-20.0.1+9.1/bin
export JAVA_HOME=/home/hhyh/.graalvm-jdk-20.0.1+9.1
# set fonts

# setfont sun12x22
