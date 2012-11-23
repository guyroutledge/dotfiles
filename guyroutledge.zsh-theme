# guyroutledge.zsh-theme
#
# Author: Guy Routledge
# URL: http://guyroutledge.co.uk/
#
# Created on:		Nov 16, 2012

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

PROMPT='
%{$fg[green]%}--➤ %{$fg[white]%}%D{[%I:%M:%S]} %{$fg[green]%}---------------------------------------------------------
%{$fg[cyan]%}--➤ %n%{$fg[blue]%}@%{$fg[cyan]%}%m%{$reset_color%} in %{$fg[green]%}$(collapse_pwd)%{$reset_color%}$(git_prompt_info)
%{$fg[yellow]%}--➤%{$reset_color%} '

RPROMPT='%{$fg_bold[green]%}$(battery_charge)%{$reset_color%} !%{%B%F{cyan}%}%!%{%f%k%b%}'

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg_bold[red]%}$(prompt_char) %{$fg[blue]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="]%{$fg_bold[red]%} ✘"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[red]%} ?"
ZSH_THEME_GIT_PROMPT_CLEAN="]%{$reset_color%}%{$fg_bold[green]%} ✰"
