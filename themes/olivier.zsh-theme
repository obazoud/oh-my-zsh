# get the name of the branch we are on
function git_prompt_info() {
  ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$(parse_git_dirty)$(git_uptream_info)$(git_prompt_status)$(git_prompt_ahead)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

# find how many commits we are ahead/behind our upstream
function git_uptream_info() {
  count=$(git rev-list --count --left-right @{upstream}...HEAD 2> /dev/null)
  case "$count" in
    "") # no upstream
      up=" u?" ;;
    "0	0") # equal to upstream
      up=" u=" ;;
    "0	"*) # ahead of upstream
      up=" u+${count#0	}" ;;
    *"	0") # behind upstream
      up=" u-${count%	0}" ;;
    *)	    # diverged from upstream
      up=" u+${count#*	}-${count%	*}" ;;
  esac
  echo "$ZSH_THEME_GIT_PROMPT_UPSTREAM$up"
}

#PROMPT=$'%{$fg_bold[blue]%}%D{[%I:%M:%S]} %{$fg_bold[green]%}%n@%m %{$reset_color%}%{$fg[white]%}[%~]%{$reset_color%} $(git_prompt_info)\
#%{$fg_bold[magenta]%}%{$fg_bold[magenta]%} %#%{$reset_color%} '
PROMPT=$'%{$fg_bold[blue]%}%D{[%H:%M:%S]} %{$fg_bold[green]%}%n@%m %{$reset_color%}$(git_prompt_info)\
%{$fg_bold[magenta]%}%{$fg_bold[magenta]%} %#%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[red]%}( "
ZSH_THEME_GIT_PROMPT_SUFFIX=" %{$reset_color%}%{$fg_bold[red]%})"

ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗"

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} ✚"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%} ✹"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✖"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%} ➜"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%} ✂"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} ✭"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg_bold[cyan]%} ↑"
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="%{$fg_bold[magenta]%} ↑"
ZSH_THEME_GIT_PROMPT_UPSTREAM="%{$fg[red]%}"
