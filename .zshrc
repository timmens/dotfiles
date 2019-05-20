POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k
source ~/antigen.zsh #source to antigen

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation.
#export ZSH=$HOME/.oh-my-zsh

# Load oh-my-zsh module
antigen use oh-my-zsh

# Path to z.sh

# POWERLEVEL9K MODS
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status)
POWERLEVEL9K_SHORTEN_DIR_LENGTH=4
#POWERLEVEL9K_SHORTEN_DELIMITER=""
#POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
#POWERLEVEL9K_PROMPT_ON_NEWLINE=true
#POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_DIR_HOME_FOREGROUND='white'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='white'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='white'
POWERLEVEL9K_DIR_ETC_FOREGROUND='white'
POWERLEVEL9K_DIR_HOME_BACKGROUND='23'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='23'
POWERLEVEL9K_DIR_ETC_BACKGROUND='23'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='23'

# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Bundles from default repo (robbyrusell's oh-my-zsh)
antigen bundle git
antigen bundle pip
antigen bundle command-not-found


# Syntax Highlighting bundle
antigen bundle zsh-users/zsh-syntax-highlighting

# Load theme 
antigen theme bhilburn/powerlevel9k powerlevel9k

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

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

#Example aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias open="xdg-open"
alias matlab="(cd /usr/local/MATLAB/R2018b/bin && ./matlab)"

#initialize Z (https://github.com/rupa/z) 
. ~/z.sh 

antigen apply #Tell antigen you're done
