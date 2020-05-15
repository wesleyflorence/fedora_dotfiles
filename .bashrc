# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias vim='nvim'

# Dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Journal
alias journal='nvim ~/Dropbox/journal/$(date "+%Y")/$(date "+%m")/$(date "+%Y.%m.%d").md'

# Git Branch
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# Prompt
export PS1="\[\033[38;5;13m\]\u@\h \[\e[32m\]\w \[\e[91m\]\$(parse_git_branch)\[\e[00m\] ⚡ "
