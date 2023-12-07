# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# History Options
#
# Don't put duplicate lines in the history.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
#
# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit'
export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls' # Ignore the ls command as well

# Whenever displaying the prompt, write the previous line to disk
export PROMPT_COMMAND="history -a"

ZSH_DIR="${HOME}/.zshd"

if [ -f "${ZSH_DIR}/.zsh_aliases" ]; then
  . "${ZSH_DIR}/.zsh_aliases"
fi

if [ -f "${ZSH_DIR}/.zshrc_find-in.sh" ]; then
  . "${ZSH_DIR}/.zshrc_find-in.sh"
fi

if [ -f "${ZSH_DIR}/.zshrc_cd.sh" ]; then
  . "${ZSH_DIR}/.zshrc_cd.sh"
fi

if [ -f "${ZSH_DIR}/.zsh_exports" ]; then
  . "${ZSH_DIR}/.zsh_exports"
fi

