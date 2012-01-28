# Changes directory to my developer dir
c() { cd ~/Developer/$1; }
_c() { _files -W ~/Developer -/; }
compdef _c c

# Command to refresh the system
refreshr() { brew update && cd ~/.rbenv && git pull && cd ~ && gem update --system && gem update; }