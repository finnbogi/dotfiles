#
# ~/.bashrc
#

#export PATH="

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

fastfetch

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

alias vim='nvim'
alias cat='bat'
alias ll='ls -la'
alias k='kubectl'
complete -o default -F __start_kubectl k
alias bp='vim ~/.bashrc'
alias sp='source ~/.bashrc'
alias r='ranger'
alias lg='lazygit'
alias ds='devbox shell'

alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'

#export GPG_TTY=$(tty)
#export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

# ----------------------------------------------------------------

## https://github.com/vfarcic/dotfiles/blob/main/.zshrc

# autoload -Uz compinit
# compinit

# setopt HIST_IGNORE_ALL_DUPS

# Devbox
DEVBOX_NO_PROMPT=true
eval "$(devbox global shellenv --init-hook)"
#eval "$(devbox global shellenv)"


## create symlink to apps for i3 to use them
# sudo ln -s /home/finnbogi/.local/share/devbox/global/default/.devbox/nix/profile/default/bin/kubectl /usr/local/bin/
# gh
#
# Git
LANG=en_DK.UTF-8

# Completions
source <(devbox completion bash)
#source <(docker completion bash)
source <(kubectl completion bash)

# Starship
eval "$(starship init bash)"

# The Fuck
eval $(thefuck --alias)

# Zoxide
eval "$(zoxide init --cmd cd bash)"

# Aliases
alias lsa='eza --long --all'
alias ls='eza --long --all --no-permissions --no-filesize --no-user --no-time --git'
alias lst='eza --long --all --no-permissions --no-filesize --no-user --git --sort modified'
alias fzfp='fzf --preview \"bat --style numbers --color always {}\"'
alias cat='bat --paging never --theme DarkNeon --style plain'
alias gs='git status'
# -----------------------------------------------------------------


git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

git config --global core.editor "nvim"
#export NIX_EXPERIMENTAL_FEATURES="nix-command flakes"
#export KUBECONFIG=/home/finnbogi/.kube/homelab.config

# Golang environment variables
#export GOROOT=/usr/local/go
#export GOPATH=$HOME/go

# Update PATH to include GOPATH and GOROOT binaries
#export PATH=$GOPATH/bin:$GOROOT/bin:$HOME/.local/bin:$PATH

# source /etc/profile.d/bash_completion.sh

export PATH="$PATH:$HOME/.local/bin:$(go env GOBIN):$(go env GOPATH)/bin"

