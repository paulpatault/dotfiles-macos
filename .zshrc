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
export PATH="/opt/homebrew/opt/openssl@1.1/bin:$PATH"
export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"

export LDFLAGS="-L/opt/homebrew/opt/openssl@3/lib $LDFLAGS"
export LDFLAGS="-L/opt/homebrew/lib $LDFLAGS"
export LDFLAGS="-L/opt/homebrew/Cellar/openssl@1.1/1.1.1l_1/lib $LDFLAGS"

export CFLAGS="-I/opt/homebrew/include $CFLAGS"

export CXXFLAGS="-I/opt/homebrew/opt/openssl@3/include $CXXFLAGS"
export CXXFLAGS="-I/opt/homebrew/include $CXXFLAGS"

export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@3/lib/pkgconfig"

#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=# THEME

ZSH_THEME=""

autoload -U promptinit; promptinit

PURE_PROMPT_SYMBOL="λ"

zstyle :prompt:pure:path color white

zstyle :prompt:pure:prompt:success color cyan
zstyle :prompt:pure:prompt:error color '#D73232'

prompt pure

#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=# ALIAS

#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=# SAFE
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=# KITTY
alias ssh="kitty +kitten ssh"
alias icat="kitty +kitten icat"


#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=# SHORT
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
alias diff="colordiff"

#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=# ZSHRC
alias ec="nvim ~/.zshrc"
alias sc="source ~/.zshrc"

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

#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=# APPS
alias lg="lazygit"
alias spark="open /Applications/Spark.app"
alias safari="open /Applications/Safari.app"
alias discord="open /Applications/Discord.app"
alias whatsapp="open /Applications/WhatsApp.app"
alias todo="open /Applications/Microsoft\ To\ Do.app"

#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=# M1MPRI
alias wedt="open https://sites.google.com/view/mastersagenda/mpri"
alias ledt="open ~/MPRI/EDT/EDT-M1T2.pdf"
alias fac="cd ~/MPRI"
alias mpri="cd ~/MPRI"
alias kawa="cd ~/MPRI/T1/Compilation/Kawa"
alias quantum="cd ~/MPRI/T2/FQI"
alias graphs="cd ~/MPRI/T2/AG"
alias combalg="cd ~/MPRI/T2/CA"
alias andrei="cd ~/MPRI/T2/PP"
alias sysreact="cd ~/MPRI/ENS/SystReact"
alias verif="cd ~/MPRI/ENS/Verification"

export LUSTRE_INSTALL=~/MPRI/ENS/SystReact/Lustre/lustre-v4-III-e-macosx/
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
