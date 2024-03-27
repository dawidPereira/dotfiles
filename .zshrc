# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
if [ -f ~/.config/zshrc/zsh_source ]; then
    source ~/.config/zshrc/zsh_source
fi

# Reevaluate the prompt string each time it's displaying a prompt
setopt prompt_subst
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
autoload bashcompinit && bashcompinit
autoload -Uz compinit
compinit
complete -C '/usr/local/bin/aws_completer' aws

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
eval "$(starship init zsh)"

#alias ls='colorls'
alias config='/usr/bin/git --git-dir=/Users/dawid/.dotfiles/ --work-tree=/Users/dawid'
source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
