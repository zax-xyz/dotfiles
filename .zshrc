# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$HOME/.gem/ruby/2.6.0/bin:$PATH:/usr/lib/ccache/bin/

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/shell_history

# Vim bindings
bindkey -v
export KEYTIMEOUT=1

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

setopt no_share_history
unsetopt share_history

if [ -f ~/.aliasrc ]; then
. ~/.aliasrc
fi

if [ -f ~/.functionrc ]; then
. ~/.functionrc
fi

[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

fpath+=$HOME/.local/share/zsh/prompts/pure

# Better prompt
setopt promptsubst
autoload -U promptinit && promptinit && prompt pure

# Enables better tab completion
autoload -Uz compinit && compinit

# Case insensitive tab completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

# Load plugins
plugin_dir=~/.local/share/zsh/plugins
source $plugin_dir/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source $plugin_dir/zsh-history-substring-search/zsh-history-substring-search.zsh
source $plugin_dir/zsh-autosuggestions/zsh-autosuggestions.zsh

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
