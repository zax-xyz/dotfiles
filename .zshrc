source ~/.scripts/mocha.sh

P10K_INSTANT_PROMPT_PATH="${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
[[ -r "$P10K_INSTANT_PROMPT_PATH" ]] && source "$P10K_INSTANT_PROMPT_PATH"
source ~/.local/share/zsh/prompts/powerlevel10k/powerlevel10k.zsh-theme

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/shell_history

source ~/.aliasrc
source ~/.functionrc

setopt no_share_history
unsetopt share_history

# Enables better tab completion
autoload -Uz compinit && compinit -d ~/.cache/zsh/zcompdump
# autoload -Uz compinit 
# if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
# 	compinit;
# else
# 	compinit -C;
# fi
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

# Vim chad 😎
bindkey -v
autoload edit-command-line; zle -N edit-command-line
bindkey '^v' edit-command-line

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh
[[ -r "/usr/share/nvm/init-nvm.sh" ]] && {
    source /usr/share/nvm/init-nvm.sh

    autoload -U add-zsh-hook
    load-nvmrc() {
      local nvmrc_path="$(nvm_find_nvmrc)"

      if [ -n "$nvmrc_path" ]; then
        local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

        if [ "$nvmrc_node_version" = "N/A" ]; then
          nvm install
        elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
          nvm use
        fi
      elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
        echo "Reverting to nvm default version"
        nvm use default
      fi
    }
    add-zsh-hook chpwd load-nvmrc
    load-nvmrc
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval $(keychain --eval --quiet id_rsa)
