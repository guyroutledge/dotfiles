# guyroutledge.zsh-theme
#
# Author: Guy Routledge
# URL: http://guyroutledge.co.uk/
#
# Created on:		Nov 16, 2012

function add_spacing {
	local spacing=""
	local width
	(( width = ${COLUMNS} - 15 ))
	for i in {1..$width}; do
		spacing="${spacing} "
	done
	echo $spacing
}

function collapse_pwd {
    echo $(pwd | sed -e "s,^$HOME,~,")
}

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    echo '○'
}

function battery_charge {
    echo `$BAT_CHARGE` 2>/dev/null
}
function separator_color {
	[ -n "$SSH_CLIENT" ] && echo red || echo grey
}
function host_color {
	[ -n "$SSH_CLIENT" ] && echo red || echo cyan
}

PROMPT='
%{$bg[$(separator_color)]%}%{$fg[white]%}--@ %{$fg[white]%}%D{[%I:%M:%S]}$(add_spacing)%{$reset_color%}
%{$reset_color%}%{$fg[$(host_color)]%}--☛ %n%{$fg_bold[$(host_color)]%}@%{$reset_color%}%{$fg[$(host_color)]%}%m%{$reset_color%} in %{$fg[green]%}$(collapse_pwd)%{$reset_color%}$(git_prompt_info)
%{$fg[yellow]%}--%#%{$reset_color%} '

RPROMPT='%{$fg_bold[green]%}$(battery_charge)%{$reset_color%} !%{%B%F{$(host_color)}%}%!%{%f%k%b%}'

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg_bold[red]%}$(prompt_char) %{$fg[blue]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="]%{$fg_bold[red]%} ✘"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[red]%} ?"
ZSH_THEME_GIT_PROMPT_CLEAN="]%{$reset_color%}%{$fg_bold[green]%} ✰"
