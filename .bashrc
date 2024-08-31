#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

neofetch

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

alias vim='nvim'
alias cat='bat'
alias ll='ls -la'


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

# Git
LANG=en_US.UTF-8

# Completions
source <(devbox completion bash)
#source <(docker completion bash)
#source <(kubectl completion bash)

# Starship
eval "$(starship init bash)"

# The Fuck
eval $(thefuck --alias)

# Zoxide
eval "$(zoxide init --cmd cd bash)"

# Aliases
alias ls='eza --long --all --no-permissions --no-filesize --no-user --no-time --git'
alias lst='eza --long --all --no-permissions --no-filesize --no-user --git --sort modified'
alias fzfp='fzf --preview \"bat --style numbers --color always {}\"'
alias cat='bat --paging never --theme DarkNeon --style plain'

# -----------------------------------------------------------------


git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# source /etc/profile.d/bash_completion.sh
