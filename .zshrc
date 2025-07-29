source ~/.scripts/mocha.sh

P10K_INSTANT_PROMPT_PATH="${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
[[ -r "$P10K_INSTANT_PROMPT_PATH" ]] && source "$P10K_INSTANT_PROMPT_PATH"
source ~/.local/share/zsh/prompts/powerlevel10k/powerlevel10k.zsh-theme

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/shell_history


# Enables better tab completion
# autoload -Uz compinit && compinit -d ~/.cache/zsh/zcompdump
autoload -Uz compinit 
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
	compinit;
else
	compinit -C;
fi
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
zstyle ':completion:*' menu select
# Case insensitive tab completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

plugins=(fast-syntax-highlighting zsh-history-substring-search zsh-autosuggestions zsh-vi-mode abbrev-alias)
for plugin in $plugins; do
    source ~/.local/share/zsh/plugins/$plugin/$plugin.plugin.zsh
done

# Vim chad 😎
bindkey -v
autoload edit-command-line; zle -N edit-command-line
bindkey '^v' edit-command-line

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
source ~/.p10k.zsh

abbrev-alias -i
source ~/.aliasrc
source ~/.functionrc

cmd-exists() {
    hash $1 2> /dev/null
}

export PATH="$HOME/.local/share/pnpm:$HOME/.local/share/fnm:$PATH"
cmd-exists fnm && eval "$(fnm env --use-on-cd --version-file-strategy=recursive --corepack-enabled)"
cmd-exists keychain && eval $(keychain --eval --quiet id_rsa)
cmd-exists thefuck && eval $(thefuck --alias)
cmd-exists zoxide && eval "$(zoxide init zsh)"

export SKIM_DEFAULT_COMMAND="fd --type f || git ls-tree -r --name-only HEAD || rg --files || find ."
export FZF_DEFAULT_COMMAND="$SKIM_DEFAULT_COMMAND"
