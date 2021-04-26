#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=# OH-MY-ZSH
export ZSH="/Users/paulpatault/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=# CONFIG
CASE_SENSITIVE="true"
COMPLETION_WAITING_DOTS="true"

export EDITOR='nvim'
export KITTY_CONFIG_EDITOR='nvim'

#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=# PLUGINS
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
)

autoload -U compinit && compinit
# Completion for kitty
kitty + complete setup zsh | source /dev/stdin

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=# PATH
fpath+=$HOME/.zsh/pure

export PATH="/usr/local/opt/ncurses/bin:$PATH"
export PATH=$PATH:/usr/local/opt/llvm/bin
export PATH="/usr/local/opt/opencv@2/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=# THEME
# autoload -U promptinit; promptinit
# prompt pure

ZSH_THEME=""

autoload -U promptinit; promptinit

PURE_PROMPT_SYMBOL="λ"

prompt pure

#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=# THE FUCK
eval $(thefuck --alias)

#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=# ALIAS
alias edt="open ~/Documents/Université/ADMIN/EDT/EDT\ S6.png"
alias fac="cd ~/Documents/Université"
alias fac6="cd ~/Documents/Université/S6"
alias fac5="cd ~/Documents/Université/S5"
alias so_ml="source ~/Documents/Université/S6/IAS/venv/bin/activate"

#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=# OPAM CONFIGURATION
test -r /Users/paulpatault/.opam/opam-init/init.zsh && . /Users/paulpatault/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
