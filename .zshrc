# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# Reevaluate the prompt string each time it's displaying a prompt
setopt prompt_subst
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
autoload bashcompinit && bashcompinit
autoload -Uz compinit
compinit
#source <(kubectl completion zsh)
complete -C '/usr/local/bin/aws_completer' aws

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^w' autosuggest-execute
bindkey '^y' autosuggest-accept
bindkey '^u' autosuggest-toggle
bindkey '^L' vi-forward-word
bindkey '^k' up-line-or-search
bindkey '^j' down-line-or-search

eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# You may need to manually set your language environment
export LANG=en_US.UTF-8

export EDITOR=/opt/homebrew/bin/nvim

#alias la=tree
#alkias cat=bat

# Git
alias gc="git commit -m"
alias gca="git commit -a -m"
alias gp="git push origin HEAD"
alias gpu="git pull origin"
alias gst="git status"
alias glog="git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit"
alias gdiff="git diff"
alias gco="git checkout"
alias gb='git branch'
alias gba='git branch -a'
alias gadd='git add'
alias ga='git add -p'
alias gcoall='git checkout -- .'
alias gr='git remote'
alias gre='git reset'

# Docker
alias dco="docker compose"
alias dps="docker ps"
alias dpa="docker ps -a"
alias dl="docker ps -l -q"
alias dx="docker exec -it"

# Dirs
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."


# VIM
alias v="/opt/homebrew/bin/nvim"

# Nmap
alias nm="nmap -sC -sV -oN nmap"

alias cl='clear'

# K8S
# export KUBECONFIG=~/.kube/config
# alias k="kubectl"
# alias ka="kubectl apply -f"
# alias kg="kubectl get"
# alias kd="kubectl describe"
# alias kdel="kubectl delete"
# alias kl="kubectl logs"
# alias kgpo="kubectl get pod"
# alias kgd="kubectl get deployments"
# alias kc="kubectx"
# alias kns="kubens"
# alias kl="kubectl logs -f"
# alias ke="kubectl exec -it"
# alias kcns='kubectl config set-context --current --namespace'
# alias podname=''
#
# HTTP requests with xh!
alias http="xh"

# VI Mode!!!
bindkey jj vi-cmd-mode

# Eza
alias l="eza -l --icons --git -a"
alias lt="eza --tree --level=2 --long --icons --git"


# FZF
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH=/opt/homebrew/bin:$PATH

alias mat='osascript -e "tell application \"System Events\" to key code 126 using {command down}" && tmux neww "cmatrix"'

function ranger {
	local IFS=$'\t\n'
	local tempfile="$(mktemp -t tmp.XXXXXX)"
	local ranger_cmd=(
		command
		ranger
		--cmd="map Q chain shell echo %d > "$tempfile"; quitall"
	)

	${ranger_cmd[@]} "$@"
	if [[ -f "$tempfile" ]] && [[ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]]; then
		cd -- "$(cat "$tempfile")" || return
	fi
	command rm -f -- "$tempfile" 2>/dev/null
}
alias rr='ranger'


# Configure FZF.
alias fp="fzf --preview 'bat --style=numbers --color=always {}'"
alias repos="cd ~/repositories"
alias vn="cd ~/Notes/Notes/ && l; nvim ."
alias notes="~/Notes/Notes/"
alias vnotes="cd ~/Notes/Notes/ && l; nvim ."
bindkey '^ ' autosuggest-accept

alias vim='nvim'
eval "$(fzf --zsh)"
# navigation
cx() { cd "$@" && l; }
fcd() { cd "$(find . -type d -not -path '*/.*' | fzf)" && l; }
fdv() { cd "$(find . -type d -not -path '*/.*' | fzf)"  && l; nvim . }
f() { echo "$(find . -type f -not -path '*/.*' | fzf)" | pbcopy }
fv() { nvim "$(find . -type f -not -path '*/.*' | fzf)" }

#eval "$(zoxide init zsh)"

bindkey '^ ' autosuggest-accept

#alias ls='colorls'
alias vim='nvim'
alias config='/usr/bin/git --git-dir=/Users/dawid/.dotfiles/ --work-tree=/Users/dawid'
source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
