#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=# p10k
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source ~/powerlevel10k/powerlevel10k.zsh-theme

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
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=# PATH
export PATH="/usr/local/opt/ncurses/bin:$PATH"
export PATH=$PATH:/usr/local/opt/llvm/bin
export PATH="/usr/local/opt/opencv@2/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

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
