#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=# OH-MY-ZSH
export ZSH="/Users/paulpatault/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=# CONFIG
CASE_SENSITIVE="true"
COMPLETION_WAITING_DOTS="true"

export EDITOR='nvim'
export KITTY_CONFIG_EDITOR='nvim'

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=# PLUGINS
plugins=(
  git
)

autoload -Uz compinit
compinit
# Completion for kitty
kitty + complete setup zsh | source /dev/stdin

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=# PATH
fpath+=$HOME/.zsh/pure

export PATH="/usr/local/opt/ncurses/bin:$PATH"
export PATH="/usr/local/opt/opencv@2/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/gnu-getopt/bin:$PATH"
export PATH="/usr/local/lib/ruby/gems/3.0.0/bin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=# THEME

ZSH_THEME=""

autoload -U promptinit; promptinit

PURE_PROMPT_SYMBOL="λ"

prompt pure

#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=# ALIAS

#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=# CMD
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

alias v="nvim"
alias vi="nvim"
alias vim="nvim"

alias ec="nvim ~/.zshrc"
alias sc="source ~/.zshrc"

alias mk="make -j8"

alias icat="kitty +kitten icat"

#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=# GIT
alias g="git"
alias ga="git add"
alias gaa="git add --all"
alias gb="git branch"
alias gbd="git branch -d"
alias gd="git diff"
alias gs="git status"
alias gl="git log"
alias glp="git log -p"
alias gch="git checkout"
alias gco="git commit"
alias gc="git clone"
alias gcom="git commit -m"
alias gp="git pull"
alias gP="git push"

alias lg="lazygit"

#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=# TMP

alias runLocalWhy3="cd ~/Projets/why3 && rm -rf src/trywhy3/why3_worker.js src/trywhy3/trywhy3.js && make trywhy3 && cd src/trywhy3 && python3 -m http.server 8080 && cd ../.."
alias todomd="cd ~/Projets/why3 && nvim avancement_et_questions.md"

#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=# OPAM CONFIGURATION
test -r /Users/paulpatault/.opam/opam-init/init.zsh && . /Users/paulpatault/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

eval "$(/opt/homebrew/bin/brew shellenv)"
