# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ======================================================================================
# Exports
# ======================================================================================

export GEM_HOME="$HOME/gems"
export PATH=$"HOME/gems/bin:$PATH"
export PATH=$PATH:/usr/local/texlive/2022/bin/x86_64-linux  # latex


# ======================================================================================
# Antigen (oh-my-zsh plugin manager)
# ======================================================================================

source ~/antigen.zsh
antigen init ~/.antigenrc


# ======================================================================================
# Aliases
# ======================================================================================

alias add="git add"
alias checkout="git checkout"
alias commit="git commit"
alias merge="git merge"
alias pull="git pull"
alias push="git push"
alias stash="git stash"
alias status="git status"

alias copy="xclip -sel c <"  # copy file contents to clipboard

# ======================================================================================
# Functions
# ======================================================================================
dict() {
    if [[ $# -eq 1 ]]; then
	max_results=10
	word="$1"
    elif [[ $# -eq 2 ]]; then
	max_results="$1"
	word="$2"
    fi

    dict.cc.py --max-results "$max_results" en de "$word"
}


ma() {
  local yaml_file="environment.yml"
  local name
  
  # Check if the YAML file exists
  if [[ ! -f "$yaml_file" ]]; then
    echo "YAML file $yaml_file not found in the current directory."
    return 1
  fi
  
  # Get the name from the YAML file
  name=$(awk '/^name:/ {print $2}' "$yaml_file")
  
  # Check if name is empty
  if [[ -z "$name" ]]; then
    echo "Name not found in the YAML file."
    return 1
  fi
  
  # Activate the environment using Mamba
  mamba activate "$name"
}

# ======================================================================================
# Conda initialization
# ======================================================================================

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/tim/mambaforge/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/tim/mambaforge/etc/profile.d/conda.sh" ]; then
        . "/home/tim/mambaforge/etc/profile.d/conda.sh"
    else
        export PATH="/home/tim/mambaforge/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/home/tim/mambaforge/etc/profile.d/mamba.sh" ]; then
    . "/home/tim/mambaforge/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
