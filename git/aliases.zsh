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
alias tower='gittower .'

# from https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/git/git.plugin.zsh
#
# Will return the current branch name
# Usage example: git pull origin $(current-branch)
#
function current-branch() {
 ref=$(git symbolic-ref HEAD 2> /dev/null) || \
 ref=$(git rev-parse --short HEAD 2> /dev/null) || return
 echo ${ref#refs/heads/}
}

function current-repository() {
 ref=$(git symbolic-ref HEAD 2> /dev/null) || \
 ref=$(git rev-parse --short HEAD 2> /dev/null) || return
 echo $(git remote -v | cut -d':' -f 2)
}

function git-branches() {
  git branch --sort=committerdate
}

function git-rename() {
  git branch -m $1
}

# these aliases take advantage of the previous function
alias ggpull='git pull origin $(current-branch)'
#compdef ggpull=git
alias ggpur='git pull --rebase origin $(current-branch)'
#compdef ggpur=git
alias ggpush='git push origin $(current-branch)'
#compdef ggpush=git
alias ggpnp='git pull origin $(current-branch) && git push origin $(current-branch)'
#compdef ggpnp=git
