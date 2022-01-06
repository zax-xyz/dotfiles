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

# Enables better tab completion
autoload -Uz compinit && compinit -d ~/.cache/zsh/zcompdump
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
zstyle ':completion:*' menu select

# Case insensitive tab completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

# Load plugins
plugin_dir=~/.local/share/zsh/plugins
source $plugin_dir/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source $plugin_dir/zsh-history-substring-search/zsh-history-substring-search.zsh
source $plugin_dir/zsh-autosuggestions/zsh-autosuggestions.zsh
source $plugin_dir/zsh-vi-mode/zsh-vi-mode.plugin.zsh

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

fpath+=$HOME/.local/share/zsh/prompts/pure
autoload -U promptinit; promptinit
prompt pure
