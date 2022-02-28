export EDITOR=nvim
export QT_QPA_PLATFORMTHEME=qt5ct
export TERMINAL=st
export MOZ_USE_XINPUT2=1
export MOZ_X11_EGL=1
export TMUX=
export TERM=st-256color
export SXHKD_SHELL=sh

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

export HTTPIE_CONFIG_DIR="$XDG_CONFIG_HOME/httpie"
export IPYTHONDIR="$XDG_CONFIG_HOME/ipython"
export GOPATH="/mnt/data/code/go"

export PATH="/usr/lib/ccache/bin/:$PATH:$GOPATH/bin:$HOME/.local/bin:$HOME/.local/share/bin:$HOME/.local/share/gem/ruby/3.0.0/bin/:$HOME/.cargo/bin"

# export QT_IM_MODULE=fcitx
# export XMODIFIERS=@im-fcitx
# export GTK_IM_MODULE=fcitx

export MPD_HOST=$(cat ~/.config/MPD_PASS)@127.0.0.1
# syndaemon -K -i 0.2 -R -d
# synclient RightButtonAreaLeft=0
# synclient RightButtonAreaTop=0

export QT_STYLE_OVERRIDE=kvantum

export ELAPSE_UPDATE_DURATION=5000
export FZF_DEFAULT_COMMAND='fd --type f'

export HASTEBIN_SERVER_URL='https://bin.zaxu.xyz'
