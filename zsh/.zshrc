#Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /usr/share/fzf/shell/key-bindings.zsh

plugins=(git sudo kubectl fzf zsh-autosuggestions poetry)

USE_POWERLINE="true"

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
fpath+=~/.zfunc

zstyle :compinstall filename '/home/udai/.zshrc'

autoload -Uz compinit
compinit -i
# End of lines added by compinstall
source ~/.dotfiles/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_OPTS="--extended"
export FZF_DEFAULT_COMMAND="fd --type f"
export FZF_CTRL_T_COMMMAND="$FZF_DEFAULT_COMMAND"

export EDITOR=nvim
alias vim=nvim
alias vi=nvim
alias cp=xcp
alias ls=lsd
alias cat=bat
alias z=zoxide

# alias ls='ls --color=auto'
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export PATH=/home/udai/.dotfiles/bin:$PATH

eval "$(zoxide init --cmd z zsh)"
# source <(rustup completions zsh)

export PATH=$PATH:$HOME/.cargo/bin

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
# source ~/.config/envman/PATH.env
source "$HOME/.cargo/env"

# >>>> Vagrant command completion (start)
fpath=(/opt/vagrant/embedded/gems/gems/vagrant-2.4.1/contrib/zsh $fpath)
compinit
# <<<<  Vagrant command completion (end)

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/udai/.sware/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/udai/.sware/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/udai/.sware/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/udai/.sware/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit
complete -C '/usr/bin/aws_completer' aws

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH=$PATH:/home/udai/node_modules/fsmonitor/bin
alias d3x_sync="fsmonitor.js rsync -azP --del --exclude=.git  -e "ssh -p 30690" /oneconvergence/gi udai-kiran@34.220.13.115:~/"

source <(kubectl completion zsh)
eval "$(gh copilot alias -- zsh)"

export PATH=$HOME/.local/bin:$PATH
alias tt="taskwarrior-tui"

