find_in_() {
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

alias find-in='find_in_'

