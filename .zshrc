# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export STARSHIP_CONFIG=~/.config/starship/starship.toml
if [ -f ~/.config/zshrc/zsh_source ]; then
    source ~/.config/zshrc/zsh_source
fi
export PATH="$HOME/.config/tmux/plugins/tmuxifier/bin:$PATH"
export LANG=en_US.UTF-8
export EDITOR=/opt/homebrew/bin/nvim
export PATH=/opt/homebrew/bin:$PATH
# Reevaluate the prompt string each time it's displaying a prompt
setopt prompt_subst
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
autoload bashcompinit && bashcompinit
autoload -Uz compinit
compinit
complete -C '/usr/local/bin/aws_completer' aws

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
eval "$(starship init zsh)"
eval "$(tmuxifier init -)"

#alias ls='colorls'
alias config='/usr/bin/git --git-dir=/Users/dawid/.dotfiles/ --work-tree=/Users/dawid'
source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
