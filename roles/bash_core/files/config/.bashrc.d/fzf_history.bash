FZF_GLOBAL_HISTFILE="${FZF_GLOBAL_HISTFILE:-$HOME/.bash_global_history}"
FZF_GLOBAL_HISTSIZE="${FZF_GLOBAL_HISTSIZE:-50000}"
touch "${FZF_GLOBAL_HISTFILE}"

# Truncate global history file if it exceeds FZF_GLOBAL_HISTSIZE
if [[ -f "$FZF_GLOBAL_HISTFILE" ]]; then
  _fzf_hist_lines=$(wc -l < "$FZF_GLOBAL_HISTFILE")
  if (( _fzf_hist_lines > FZF_GLOBAL_HISTSIZE )); then
    tail -n "$FZF_GLOBAL_HISTSIZE" "$FZF_GLOBAL_HISTFILE" > "$FZF_GLOBAL_HISTFILE.tmp" &&
      mv "$FZF_GLOBAL_HISTFILE.tmp" "$FZF_GLOBAL_HISTFILE"
  fi
  unset _fzf_hist_lines
fi

_fzf_hist_last=""

_fzf_hist_append() {
  local cmd
  cmd=$(history 1 | sed 's/^[ ]*[0-9]*[ ]*//')
  [[ "$cmd" == " "* ]] && return
  [[ "$cmd" == "$_fzf_hist_last" ]] && return
  case "$cmd" in
    ls*|ll*|tree*|cd*|..*) return ;;
  esac
  _fzf_hist_last="$cmd"
  echo "$cmd" >> "$FZF_GLOBAL_HISTFILE"
}

PROMPT_COMMAND="_fzf_hist_append${PROMPT_COMMAND:+;$PROMPT_COMMAND}"

_fzf_hist_search() {
  local selected
  selected=$(awk '!seen[$0]++' "$FZF_GLOBAL_HISTFILE" | fzf --tac --height 40% --min-height 20+ --scheme=history --query "$READLINE_LINE")
  READLINE_LINE="$selected"
  READLINE_POINT=${#READLINE_LINE}
}

[[ $- == *i* ]] && bind -x '"\C-r": _fzf_hist_search'
