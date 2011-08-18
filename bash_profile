export PATH=~/bin:$PATH
[[ -s "/Users/zporter/.rvm/scripts/rvm" ]] && source "/Users/zporter/.rvm/scripts/rvm"  # This loads RVM into a shell session.
# display git info
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ (\1$(parse_git_dirty))/"
}
export PS1='\u \[\033[1;32m\]\w\[\033[33m\]$(parse_git_branch)\[\033[0m\]$ '

# aliases
alias b=bundle
alias be='bundle exec'
alias pg='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pgkill='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
alias mongostart='sudo mongod run --config /usr/local/Cellar/mongodb/1.8.1-x86_64/mongod.conf'

# bdsm bits
export projects_path="$HOME/projects"
[[ -s "/usr/local/bdsm/extensions/builtin/core/modules/shell/project/interactive" ]] && source "/usr/local/bdsm/extensions/builtin/core/modules/shell/project/interactive"
[[ -s "/usr/local/bdsm/extensions/builtin/core/modules/shell/project/interactive" ]] && source "/usr/local/bdsm/extensions/builtin/core/modules/shell/project/interactive"

# dev-update command
alias refreshr='brew update && rvm get head && rvm reload && gem update --system && gem update'
