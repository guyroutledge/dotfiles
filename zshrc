# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="../../guyroutledge"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx battery github sublime)

source $ZSH/oh-my-zsh.sh

# Turn off auto correct
unsetopt correct_all

# Customize to your needs...
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/Users/guy/bin:/usr/local/git/bin

[[ -s "$HOME/.z.sh" ]] && source "$HOME/.z.sh"

#------------------------
# Tunnel into Tom and Co
#------------------------
function mysql_tunnel() {
ssh -f -L 3306:localhost:3306 git@web1.cloud.tomandco.co.uk -N
}

#--------------------
# Git Auto Completion
#--------------------
source ~/.git-completion.sh
#export PS1="!\! \u: \W\[\e[0;33m\]\$(__git_ps1 ' (%s)')\[\e[33;0m\] \[\e[1;31m\]>>\[\e[31;0m\]"

#-----------------
# Compass Commands
#-----------------
alias watch="compass watch ."
alias compile="compass compile"

#-----------------
# Reveal in Finder
#-----------------
function finder {
  open -R $1
}

#--------------
# Set Tab Title
#--------------
function tab {
  echo -e "\033];$1\007"
}

#----------------
# Fix Permissions
#----------------

function fix_permissions () {
 echo "Fixing files...";
 find . -type f -exec sudo chmod 664 {} \; ;
 echo "Fixing directories...";
 find . -type d -exec sudo chmod 775 {} \; ;
}

#---------------
# Common Folders
#---------------
alias ~="cd ~"
alias live="cd /Volumes/SHARE1/LIVE/"
alias dc="cd ~/Sites/dorsetcereals/"
alias tokens="cd ~/Sites/tokens/"
alias lettice="cd ~/Sites/lettice/"
alias yeo="cd ~/Sites/yeo/"
alias yeom="cd ~/Sites/yeo/"
alias bighams="cd ~/Sites/bighams/"
alias tyrrells="cd ~/Sites/tyrrells/"
alias biscuit="cd ~/Sites/biscuiteers/"
alias belvoir="cd ~/Sites/belvoir/"
alias wt="cd ~/Sites/wardthomas/"
alias jamie="cd ~/Sites/jamieoliver/"
alias kb="cd ~/Documents/knowledge-base"
alias pancakes="cd ~/Sites/pancakes"
alias steves="cd ~/Sites/stevesleaves"

alias snip="cd ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User/"

alias verbose="cd ~/Sites/guy/verbose/"

#------------
# Edit .zshrc
#------------

alias zrc="mvim ~/.zshrc"

#-----
# Misc
#-----

alias src="source ~/.zshrc"
alias ip="ifconfig | grep inet"

#----------------
# Optimize Images
#----------------

function optim {
  open -a ImageOptim.app $1
}
