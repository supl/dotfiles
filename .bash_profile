export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export TERM="screen-256color"
export EDITOR="vim"
export PATH="$HOME/bin:$PATH"

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PROMPT_COMMAND="export PS1=\"\[\e[1;3\$(expr \$(expr \$(date "+%M") + 1) % 7 + 1)m\]\H\[\e[0m\]:\[\e[1;3\$(expr \$(expr \$(date "+%M") + 2) % 7 + 1)m\]\$PWD\[\e[0m\]\$(parse_git_branch) > \""

alias ll='ls -lhF'
alias grep='grep --color'
alias vi='nvim'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

if [[ "$(uname)" == "Linux" && -f "$HOME/.bash_linux" ]]; then
    source "$HOME/.bash_linux"
fi

if [[ ("$(uname)" == "FreeBSD" || "$(uname)" == "Darwin") && -f "$HOME/.bash_freebsd" ]]; then
    source "$HOME/.bash_freebsd"
fi

if [[ -f "$HOME/.bash_local" ]]; then
    source "$HOME/.bash_local"
fi

# ssh-agent
if [[ -z $SSH_AGENT_PID ]]; then
    eval `ssh-agent -s`
    trap "ssh-agent -k" EXIT
fi

b() {
    local backto=$(pwd | grep -iEo "^.*($1)[^/]*/")
    if [ ! -z "$backto" ]; then
        cd $backto
    fi
}
