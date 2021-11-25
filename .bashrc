# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -f ~/.aliasrc ]; then
  . ~/.aliasrc
fi

if [ -f ~/.functionrc ]; then
  . ~/.functionrc
fi

if [ -t 1 ]
then
	bind Space:magic-space
fi

set -o vi
# export PATH="/usr/lib/ccache/bin/:$PATH:$HOME/bin:$HOME/.gem/ruby/2.6.0/bin"

PS1='\[\033[0;34m\]\u\[\033[0;31m\]@\[\033[0;32m\]\h \[\033[1;34m\]\W\[\033[0m\] \[\033[1;31m\]\$\[\033[0m\] '
export HISTFILESIZE=5000
export HISTFILE=~/.cache/shell_history

[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
