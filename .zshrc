source ~/.powerlevel10k
# ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
export figlet_npm_dir="/data/data/com.termux/files/home/.npm-global/lib/node_modules/figlet-cli/node_modules/figlet/fonts"
export oml_dir="/data/data/com.termux/files/home/.npm-global/lib/node_modules/oh-my-logo/node_modules/figlet/fonts"
export ascii_banner_dir="/data/data/com.termux/files/home/.local/lib/python3.14/site-packages/ascii_banner/fonts"
export figlet_py_dir="/data/data/com.termux/files/home/.local/lib/python3.14/site-packages/pyfiglet/fonts"
export CARGO_BIN="/data/data/com.termux/files/home/.cargo/bin"
export NPM_G_BIN="/data/data/com.termux/files/home/.npm-global/bin"
# ZSH_DISABLE_COMPFIX=true
export TERM="xterm-256color"
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 3

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
ZSH_CUSTOM=$HOME/.zsh

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    history-substring-search
    command-not-found
    yarn
)

# clone your external plugins if needed
external_plugins=(
  romkatv/zsh-defer
  djui/alias-tips
  # ryanccn/vivid-zsh
  mfaerevaag/wd
  hlissner/zsh-autopair
  # lukechilds/zsh-better-npm-completion
  # unixorn/git-extra-commands
  Ulfada/yadm-zsh
  spodin/zsh-fuzzy-wd
  zsh-users/zsh-autosuggestions
  # z-shell/F-Sy-H
  zdharma-continuum/fast-syntax-highlighting
)

# syntax is GITHUB_USER/REPO_NAME/{LOCAL_DIRNAME}
# for cases where plugin is not named REPO_NAME.plugin.zsh
special_plugins=(
  TamCore/autoupdate-oh-my-zsh-plugins/autoupdate
)

for repo in $external_plugins; do
  if [[ ! -d $ZSH_CUSTOM/plugins/${repo:t} ]]; then
    git clone https://github.com/${repo} $ZSH_CUSTOM/plugins/${repo:t}
  fi
done

for repo in $special_plugins; do
  if [[ ! -d $ZSH_CUSTOM/plugins/${repo:t} ]]; then
    git clone https://github.com/${repo:h} $ZSH_CUSTOM/plugins/${repo:t}
  fi
done

# now add your external plugins to your OMZ plugins list
plugins+=(${external_plugins:t})
plugins+=(${special_plugins:t})

# zstyle ':omz:plugins:yadm-zsh' aliases no
#
#
zstyle ':omz:plugins:yarn' berry yes
zstyle ':omz:plugins:yarn' aliases no
zstyle ':omz:plugins:yarn' global-path no
zstyle ':fsh:config' work-dir "${XDG_CACHE_HOME:-$HOME/.cache}/f-sy-h"
zstyle ':fsh:config' max-length 1000
zstyle ':fsh:config' theme-manager enabled
zstyle ':fsh:config' bracket-highlighting enabled
# zstyle ':fsh:config' path-blocklist '/private/*' '/mnt/slow/**'
zstyle ':fsh:config' chroma-opt-in vim
zstyle ':fsh:config' chroma-cache-seconds 5
zstyle ':fsh:config' chroma-timeout-seconds 2
#
#
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
export EDITOR='nvim'
# fi

TZ='America/New_York'; export TZ
# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# NPM_CONFIG_PREFIX=~/.npm-global
export TERMUXFILES="/data/data/com.termux/files"
alias zshconfig="nvim ~/.zshrc"
alias ls="lsd -a"
#export DEFAULT_USER='u0_a121'
alias x="am startservice -a com.termux.service_stop com.termux/.app.TermuxService"
alias src="omz reload"
alias yp="yadm push origin main"
alias yd="yadm diff -pM"
alias yc="yadm commit -a -m \"update\""
alias ya="yadm add"
alias ys="yadm status"
alias ytdlconfig="nvim ~/.config/yt-dlp/config"
alias yt-dlm="yt-dlp --config-locations ~/.config/yt-dlp/music.conf"
alias yt-dlv="yt-dlp --config-locations ~/.config/yt-dlp/video.conf"

export JQ_COLORS="1;30:1;30:1;30:1;36:1;33:1;35:1;32"
export TERMUX_ROOT="/data/data/com.termux/files"
alias has="curl -sL https://git.io/_has | bash -s"
alias toiletpy="toilet -d /data/data/com.termux/files/home/YuleLog/.venv/lib/python3.14/site-packages/pyfiglet/fonts -w 999"

alias du=du\ -h

bindkey -s … '\t'
bindkey -s ñ '~'
bindkey -s ö '"'
bindkey -s ò '`'
bindkey -s ó "'"
bindkey -s ï ':'
bindkey -s € '$'
bindkey -s ô '^'
bindkey -s ¹ '!'
bindkey -s ² '@'
bindkey -s ³ '#' 
bindkey -s ⁴ '$'
bindkey -s ⁶ '^'
bindkey -s ⁵ '%'
bindkey -s ⁷ '&'
bindkey -s ⁸ '*'
bindkey -r "^B"                # unbind (optionally)
bindkey '^G' fuzzy_wd_widget   # bind to Ctrl+G

export poop=`echo 󰇷`

function plugin-update {
  ZPLUGINDIR=${ZSH_CUSTOM}/plugins
  for d in $ZPLUGINDIR/*/.git(/); do
    echo "Updating ${d:h:t}..."
    command git -C "${d:h}" pull --ff --recurse-submodules --depth 1 --rebase --autostash
  done
}

ytdl () {
    yt-dlp --format 18 "$1"
    yt-dlp --format 140 "$1"
}

pyfiglet-all () {
    text="$1"
    for i in $(pyfiglet -l)
    do echo $i
        pyfiglet -f $i -w 999 "$text"
        echo "\n\n"
    done
}

zsh-defer autopair-init

if [[ -z $TMUX_PANE ]];then
$HOME/termuxinit.sh
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Created by `pipx` on 2025-05-20 00:43:36
export PATH="/data/data/com.termux/files/home/.local/bin:$NPM_G_BIN:$CARGO_BIN:$PATH"
# compdef _terminal-svg terminal-svg
eval "$(register-python-argcomplete pipx)"
