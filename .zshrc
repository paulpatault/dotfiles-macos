if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="/Users/paulpatault/.oh-my-zsh"

CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

COMPLETION_WAITING_DOTS="true"

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh


export EDITOR='nvim'
export KITTY_CONFIG_EDITOR='nvim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export PATH="/usr/local/opt/ncurses/bin:$PATH"
export PATH=$PATH:/usr/local/opt/llvm/bin
export PATH="/usr/local/opt/opencv@2/bin:$PATH"

# alias

alias edt="open ~/Documents/Université/ADMIN/EDT/EDT\ S6.png"
alias fac="cd ~/Documents/Université"
alias fac6="cd ~/Documents/Université/S6"
alias fac5="cd ~/Documents/Université/S5"
alias pcii="cd ~/IdeaProjects/ProjetPCII/"
alias so_ml="source ~/Documents/Université/S6/IAS/venv/bin/activate"
export PATH="/usr/local/sbin:$PATH"

# opam configuration
test -r /Users/paulpatault/.opam/opam-init/init.zsh && . /Users/paulpatault/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
