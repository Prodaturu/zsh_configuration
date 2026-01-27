# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

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
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

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
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# ------------------------- My Aliases ---------------------------

alias francinette=/Users/sprodatu/francinette/tester.sh

alias paco=/Users/sprodatu/francinette/tester.sh

alias cclean='bash ~/Cleaner_42.sh'

# ------------------------- NVM Config ---------------------------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="$HOME/homebrew/bin:$PATH"

# ------------------------- Dorker Custom Config ---------------------------

alias dock="/source /Users/sprodatu/Dorker/init.sh"
alias dick="docker run -it -v \"$(pwd)\":/app debian bash -c \"apt update && apt install valgrind make gcc clang -y && bash\""

# ------------------------- My Laziness Config ---------------------------
alias czsh='code ~/.zshrc'
alias szsh='source ~/.zshrc'

alias gs='git status'
alias gr='git remote '
alias gl='git log'
alias gra='git remote add '
alias grr='git remote remove '
alias grre='git remote rename '
alias grv='git remote -v'
alias gc='git commit -m'
alias ga='git add '
alias gall='git add *'
alias gp='git push '
alias gpl='git pull '
alias glf='git ls-files'

alias e='exit'
alias cl='clear'
alias re='make re'
alias all='make all'
alias cn='make clean'
alias fcn='make fclean'
alias code="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"

##### SIMPLE, CLEAN ALIASES #####

# cd shortcuts
alias dotdot='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias 1='cd -1'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

# sudo shortcut
alias a='alias'
alias b='brew'
alias c='code'
alias d='docker'
alias e='exit'
alias f='find . -name'
alias g='git'
alias h='history'
alias i='ifconfig'
# line 120 j function
alias k='k'
alias l='ls -lah'
alias m='make'
alias n='nano'
alias o='open'
alias p='ping'
alias q='q'
alias r='rm'
alias s='ssh'
alias t='top'
alias u='unzip'
alias v='vim'
alias w='wget'
alias x='exit'
alias y='yarn'
alias z='zsh'

# config / source shortcuts
alias czsh='code ~/.zshrc'
alias szsh='source ~/.zshrc'
alias cbash='code ~/.bash_profile'
alias sbash='source ~/.bash_profile'
alias cgit='code ~/.gitconfig'
alias sgit='git config --global --edit'

# ls / mkdir / remove
alias l='ls -lah'
alias la='ls -lAh'
alias ll='ls -lh'
alias lsa='ls -lah'
alias ls='ls -G'
alias md='mkdir -p'
alias rd='rmdir'

# Git shortcuts
alias ga='git add'
alias gaa='git add --all'
alias gb='git branch'
alias gba='git branch -a'
alias gco='git checkout'
alias gcm='git checkout master'
alias grb='git rebase'
alias grv='git remote -v'
alias gcmsg='git commit --message'
alias gl='git pull'
alias gp='git push'
alias gst='git status'
alias gss='git status --short'
alias gd='git diff'
alias gds='git diff --staged'
alias gclone='git clone --recurse-submodules'
alias gpl='git pull'
alias gpo='git push origin'
alias grh='git reset'
alias grhh='git reset --hard'
alias grs='git restore'
alias grt='cd "$(git rev-parse --show-toplevel || echo .)"'

# Better cat
alias cat='bat'

##### NEW FANCY SETTINGS (KEEP AT END) #####

PROMPT="%F{cyan}%~ %# %f"

# Rocket-style tiny cursor animation on new line
precmd() {
  printf '\e[?25l'          # hide cursor
  printf '\e[36C\e[32m*\e[0m'
  sleep 0.01
  printf '\r\e[K\e[?25h'    # clear line + show cursor at start of prompt
}


# Make "-" behave like "cd -" in zsh
dash_cd_back() {
  cd -        # go to previous directory
  zle reset-prompt
}

# Register and bind only if zle is available
if (( ${+functions[zle]} )); then
  zle -N dash_cd_back
  bindkey '-' dash_cd_back
fi


# custom: clear screen
alias cl='clear'


# Quick j helper: menu or dispatch common commands starting with "j"
j() {
  if [[ $# -eq 0 ]]; then
    cat <<'JMENU'
Select a command:
 1) jobs    - list background jobs
 2) jq      - run jq with args
 3) js      - start node REPL
 4) jupyter - start jupyter lab (if installed)
 5) jump    - use autojump (if installed)
 6) edit    - open a file with $EDITOR (usage: j edit filename)
 q) quit
JMENU
    printf "Choice: "
    read -r choice rest
    case "$choice" in
      1) jobs -l ;;
      2) command jq $rest ;;
      3) node ;;
      4) command jupyter lab $rest ;;
      5) if command -v autojump >/dev/null 2>&1; then autojump $rest; else echo "autojump not installed"; fi ;;
      6) ${EDITOR:-vi} "$rest" ;;
      q) return 0 ;;
      *) echo "Invalid choice"; return 1 ;;
    esac
  else
    case "$1" in
      jobs) shift; jobs -l ;;
      jq) shift; command jq "$@" ;;
      js) shift; node "$@" ;;
      jupyter|jup) shift; command jupyter lab "$@" ;;
      jump) shift; if command -v autojump >/dev/null 2>&1; then autojump "$@"; else echo "autojump not installed"; fi ;;
      edit) shift; ${EDITOR:-vi} "$1" ;;
      *) echo "Unknown subcommand: $1"; return 1 ;;
    esac
  fi
}



# ------------------------- Python Aliases --------------------------- 

# -------------------------- Powerlevel10k config ------------------------

# Load Homebrew config script
source $HOME/.brewconfig.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k/powerlevel10k.zsh-theme

