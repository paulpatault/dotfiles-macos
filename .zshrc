#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=# OH-MY-ZSH
export ZSH="/Users/paulpatault/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=# CONFIG
CASE_SENSITIVE="true"
COMPLETION_WAITING_DOTS="true"

export EDITOR='nvim'
export OPAMEDITOR='nvim'
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

zstyle :prompt:pure:path color white

zstyle :prompt:pure:prompt:success color cyan
zstyle :prompt:pure:prompt:error color '#D73232'

prompt pure

#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=# ALIAS

#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=# CMD
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

alias diff="colordiff"

alias v="nvim"
alias vi="nvim"
alias vim="nvim"

alias ec="nvim ~/.zshrc"
alias sc="source ~/.zshrc"

alias mk="make -j8"

alias icat="kitty +kitten icat"
alias ssh="kitty +kitten ssh"

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

#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=# Perso
alias lg="lazygit"
alias wedt="open https://sites.google.com/view/mastersagenda/mpri"
alias ledt="open ~/MPRI/EDT/EDT-M1T1.pdf"
alias fac="cd ~/MPRI"
alias mpri="cd ~/MPRI"
alias avan="cd ~/MPRI/AlgoAv"
alias dist="cd ~/MPRI/AlgoDist"
alias para="cd ~/MPRI/AlgoPara"
alias compil="cd ~/MPRI/Compilation"
alias quantum="cd ~/MPRI/Quantum"
alias sysreact="cd ~/MPRI/SystReact"
alias verif="cd ~/MPRI/Verification"

export LUSTRE_INSTALL=~/MPRI/SystReact/Lustre/lustre-v4-III-e-macosx/
source $LUSTRE_INSTALL/setenv.sh

#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=# OPAM CONFIGURATION
test -r /Users/paulpatault/.opam/opam-init/init.zsh && . /Users/paulpatault/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
export OCAMLRUNPARAM=b

eval "$(/opt/homebrew/bin/brew shellenv)"

alias luamake=/Users/paulpatault/lua-language-server/3rd/luamake/luamake

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/paulpatault/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/paulpatault/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/paulpatault/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/paulpatault/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
