# zsh - script - tim mensinger - 2020-07-18
# ------------------------------------------------------------------------------

# enable Powerlevel10k instant prompt; should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# antigen zsh plugins ----------------------------------------------------------
ZSHA_HOME=$HOME/.antigen
source ~/.config/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle pip
antigen bundle command-not-found

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-history-substring-search

antigen apply

# export ZSH="/home/tim/.oh-my-zsh"
# source $ZSH/oh-my-zsh.sh


# bindkeys ---------------------------------------------------------------------
bindkey '^[[A' history-substring-search-up  # zsh-history-substring-search
bindkey '^[[B' history-substring-search-down  # zsh-history-substring-search
# bindkey -v  # vim

# alias ------------------------------------------------------------------------
alias zshconfig="nvim ~/.zshrc"
alias i3config="nvim ~/.config/i3/config"
alias ls="ls --color=auto"

# opening pdfs
alias openf="zathura --fork"

# locking device with i3
alias lock="i3lock -c 000000 -n"
alias locksleep="i3lock -c 000000 -n & sleep && xset dpms force off"

# git
alias status="git status"
alias add="git add"
alias commit="git commit"
alias push="git push"

# github-pages
alias gitpages="ghp-import -n -p -f"

# toggle wifi
alias wifion="nmcli radio wifi on"
alias wifioff="nmcli radio wifi off"

# jump into debugger on error (python)
alias pybug="python -m pdb -c continue"

# copy file contents to clipboard
alias copy="xclip -sel c <"

# enter python debugger on error
alias pybug="python -m pdb -c continue"

# waf (oh god when will I start using pytask)
alias wafbuild="python waf.py -v"
alias wafclean="python waf.py distclean"


# functions --------------------------------------------------------------------
function open() {
    xdg-open 2>/dev/null $1 &
}
export open


# miscellaneus -----------------------------------------------------------------

# z command
. ~/bin/z.sh

# colors in tmux
export TERM=xterm-256color

# update PATH ------------------------------------------------------------------
path+=('/snap/bin')
export PATH


# conda ------------------------------------------------------------------------
#
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/tim/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/tim/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/tim/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/tim/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# ------------------------------------------------------------------------------
# POWERLEVEL10K FONT (customize prompt: ``$ p10k configure`` or edit ~/.p10k.zsh
source ~/.config/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
