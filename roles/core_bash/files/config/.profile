# .profile
# vim:foldmethod=marker ft=sh

[ -d "$HOME/.profile.d/" ] && . "$HOME/.profile.d/preinit.sh"

# Defaults {{{
export BROWSER=firefox
export EDITOR=nvim
export VISUAL="nvim --clean"
# }}}

# Programs {{{
export EZA_ICON_SPACING=2
export FZF_DEFAULT_COMMAND='rg --files'
# }}}

# Path {{{
path_prepend () {
  case ":${PATH}:" in
    *:"$1":*)
      ;;
    *)
      PATH="$1:$PATH"
      ;;
  esac
}

[ -f "$HOME/.atuin/bin/env" ] && . "$HOME/.atuin/bin/env"
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"
[ -f "$HOME/.ghcup/env" ] && . "$HOME/.ghcup/env"
path_prepend "$XDG_DATA_HOME/scryer-prolog/target/release"
path_prepend "$HOME/.local/bin"
path_prepend "$HOME/.bin"
path_prepend "$HOME/.scripts"

unset -f path_prepend
#}}}

[ -d "$HOME/.profile.d/" ] && . "$HOME/.profile.d/postinit.sh"

[ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"
