# Use `hub` as our git wrapper:
#   http://defunkt.github.com/hub/
hub_path=$(which hub)
if (( $+commands[hub] ))
then
  alias git=$hub_path
fi


# The rest of my fun git aliases
alias gl="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gp='git push origin HEAD'
alias gd='git diff'
alias gds='git diff --staged'
alias gc='git commit'
alias gca='git commit -a'
alias gcl='gitclone'
alias gco='git checkout'
alias gcb='git copy-branch-name'
alias gb='git branch'
alias gs='git status -sb' # upgrade your git if -sb breaks for you. it's fun.
alias gsu='git submodule update --init --recursive'


# from @paulmillr dotfiles
# Developer tools shortcuts.
alias tower='gittower --status'
alias t='tower'

# from https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/git/git.plugin.zsh
#
# Will return the current branch name
# Usage example: git pull origin $(current_branch)
#
function current_branch() {
 ref=$(git symbolic-ref HEAD 2> /dev/null) || \
 ref=$(git rev-parse --short HEAD 2> /dev/null) || return
 echo ${ref#refs/heads/}
}

function current_repository() {
 ref=$(git symbolic-ref HEAD 2> /dev/null) || \
 ref=$(git rev-parse --short HEAD 2> /dev/null) || return
 echo $(git remote -v | cut -d':' -f 2)
}

# these aliases take advantage of the previous function
alias ggpull='git pull origin $(current_branch)'
#compdef ggpull=git
alias ggpur='git pull --rebase origin $(current_branch)'
#compdef ggpur=git
alias ggpush='git push origin $(current_branch)'
#compdef ggpush=git
alias ggpnp='git pull origin $(current_branch) && git push origin $(current_branch)'
#compdef ggpnp=git

# Pretty log messages
function _git_log_prettily(){
 if ! [ -z $1 ]; then
   git log --pretty=$1
 fi
}
alias glp="_git_log_prettily"
#compdef _git glp=git-log
