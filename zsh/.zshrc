#POWERLEVEL10K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel10k
source ~/antigen.zsh #source to antigen

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation.
#export ZSH=$HOME/.oh-my-zsh

# Load oh-my-zsh module
antigen use oh-my-zsh

# Path to z.sh

#plugins 
plugins=()
plugins+=(pyenv)

# POWERLEVEL10K MODS
POWERLEVEL10K_LEFT_PROMPT_ELEMENTS=(anaconda virtualenv dir vcs)
POWERLEVEL10K_RIGHT_PROMPT_ELEMENTS=(status battery) #context
POWERLEVEL10K_BATTERY_ICON=$''
POWERLEVEL10K_SHORTEN_DIR_LENGTH=4
#POWERLEVEL10K_SHORTEN_DELIMITER=""
#POWERLEVEL10K_SHORTEN_STRATEGY="truncate_from_right"
#POWERLEVEL10K_PROMPT_ON_NEWLINE=true
POWERLEVEL10K_RPROMPT_ON_NEWLINE=true
POWERLEVEL10K_DIR_HOME_FOREGROUND='white'
POWERLEVEL10K_DIR_HOME_SUBFOLDER_FOREGROUND='white'
POWERLEVEL10K_DIR_DEFAULT_FOREGROUND='white'
POWERLEVEL10K_DIR_ETC_FOREGROUND='white'
POWERLEVEL10K_DIR_HOME_BACKGROUND='24'
POWERLEVEL10K_DIR_HOME_SUBFOLDER_BACKGROUND='24'
POWERLEVEL10K_DIR_ETC_BACKGROUND='24'
POWERLEVEL10K_DIR_DEFAULT_BACKGROUND='24'

# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Bundles from default repo (robbyrusell's oh-my-zsh)
antigen bundle git
antigen bundle pip
antigen bundle command-not-found

# Syntax Highlighting bundle
antigen bundle zsh-users/zsh-syntax-highlighting

# Load theme 
#antigen theme bhilburn/powerlevel9k powerlevel9k
antigen theme romkatv/powerlevel10k powerlevel10k

# Vim Keybindings
bindkey -v

#Aliases
alias zshconfig="vim ~/.zshrc"
#alias ohmyzsh="vim ~/.oh-my-zsh"
#alias open="xdg-open"
alias openf="zathura --fork"
#alias matlab="(cd /usr/local/MATLAB/R2018b/bin && ./matlab)"
alias del="rm -i"
alias lock="i3lock -c 000000 -n"
alias locksleep="i3lock -c 000000 -n & sleep 5 && xset dpms force off"
alias monitor-std="(cd ~/.screenlayout && ./standard.sh)"
alias monitor-inst="(cd ~/.screenlayout && ./statistics-institute.sh)"
alias monitor-inst2="(cd ~/.screenlayout && ./statistics-institute-small.sh)"
alias monitor-inst3="(cd ~/.screenlayout && ./statistics-institute-small-small.sh)"
alias monitor-hackathon="(cd ~/.screenlayout && ./hackathon.sh)"
alias ls="ls --color=auto"
alias brightness="xrandr --output LVDS-1 --brightness"
alias terminal-commands="cat ~/terminal_commands.txt"
alias i3commands="open ~/.config/i3/refcard.pdf"

#Custom Functions
function open() {
  xdg-open 2>/dev/null $1 &
}
export open
export TERM=xterm-256color

#initialize Z (https://github.com/rupa/z) 
. ~/z.sh 

antigen apply #Tell antigen you're done

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/tm/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/tm/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/tm/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/tm/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# direnv 
eval "$(direnv hook zsh)"
# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"
