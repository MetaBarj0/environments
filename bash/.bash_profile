alias ls='ls -G --color=auto'
alias ll='ls -liAh --color=auto'
alias s='cd ..'
alias du='du -hs'
alias df='df -h'
alias pushcd='pushd $(pwd)'

export PS1='[\u@\h \W]\$ '

# start ssh-agent if it isn't already running
running_agents="$(ps -o comm | grep ssh-agent)"
if [ -z "$running_agents" ]; then
  eval "$(ssh-agent)"
fi

search_in_file_content_() {
  local usage="$(cat << EOI

Usage:
  find_in <DIRECTORY> <PATTERN>

<DIRECTORY> must be an existing directory
<PATTERN> is an extended regular expression pattern recognized by grep -E

EOI
  )"

  local dir="$1"
  local pattern="$2"

  if [ -z "$dir" ] || [ -z "$pattern" ] || [ ! -d "$dir" ]; then
    echo "$usage" 1>&2
    return 1
  fi

  find "$dir" -type f -exec grep -EH "$pattern" {} \;
}

alias find_in='search_in_file_content_'
