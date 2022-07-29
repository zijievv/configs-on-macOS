# zvv
# Colors
local blue=$fg[blue]
local cyan=$fg[cyan]
local green=$fg[green]
local red=$fg[red]
local white=$fg[white]
local yellow=$fg[yellow]

local bblue=$fg_bold[blue]
local bcyan=$fg_bold[cyan]
local bgreen=$fg_bold[green]
local bred=$fg_bold[red]
local bwhite=$fg_bold[white]
local byellow=$fg_bold[yellow]
local bmagenta=$fg_bold[magenta]

local bgred=$bg[red]

# Git info
ZSH_THEME_GIT_PROMPT_PREFIX="%{$bcyan%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$bgreen%} ✔︎"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$bred%} ✘"
# Git status
ZSH_THEME_GIT_PROMPT_ADDED="%{$bgreen%}+"
ZSH_THEME_GIT_PROMPT_DELETED="%{$bred%}-"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$bmagenta%}✱"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$bblue%}>"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$bcyan%}="
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$byellow%}?"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$bred%}^"
# Git SHA
ZSH_THEME_GIT_PROMPT_SHA_BEFORE="%{$yellow%}"
ZSH_THEME_GIT_PROMPT_SHA_AFTER="%{$reset_color%}" 

function git_info() {
if [[ -n $(git_prompt_info) ]]; then
echo "$indicator_color❮ \
$(git_prompt_short_sha) \
$(git_prompt_info) \
$(git_prompt_status)"
fi
}

function git_user_name_prefix() {
if [[ -n $(git_prompt_info) ]]; then
echo " Ψ"
fi
}
function git_user_name() {
if [[ -n $(git_prompt_info) ]]; then
echo "$(git_current_user_name) "
fi
}

local indicator_color="%(?,%{$bcyan%},%{$bred%})"
local exit_code="%(?,, %{$bgred%}%{$bwhite%}%?%{$reset_color%})"

PROMPT='$indicator_color❮%{$reset_color%} \
%{$byellow%}%n%{$bred%}@%{$green%}$HOST\
%{$white%}: \
%{$bwhite%}%~%{$reset_color%}$exit_code
$(git_info)\
%{$bblue%}$(git_user_name_prefix)%{$byellow%}$(git_user_name)\
$indicator_color❯%{$reset_color%} '
