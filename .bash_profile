default='\e[39m'
black='\e[30m'
red='\e[31m'
green='\e[32m'
yellow='\e[33m'
blue='\e[34m'
magenta='\e[35m'
cyan='\e[36m'
lgray='\e[37m'
dgray='\e[90m'
lred='\e[91m'
lgreen='\e[92m'
lyellow='\e[93m'
lblue='\e[94m'
lmagenta='\e[95m'
lcyan='\e[96m'
white='\e[97m'
bold='\e[1m'
end='\e[0m'

function arrow_color() {
    if [ $? == 0 ]; then
        printf $green
    else
        printf $red
    fi
}

function git_branch() {
    branch=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
    if [ ! $branch == "" ]; then
        printf " $branch"
    fi
}

function git_icon_color() {
    if [[ `git status --porcelain 2> /dev/null` ]]; then
        printf $red
    else
        printf $green
    fi
}

function git_icon() {
    if [ -d .git/ ]; then
        if [[ `git status --porcelain 2> /dev/null` ]]; then
            printf " ✗"
        else
            printf " ✔"
        fi
    fi
}

export PS1="\[\$(arrow_color)\]➜  \[$default\]\W\[$lblue\]\$(git_branch)\[\$(git_icon_color)\]\$(git_icon)\[$end\] "
export CLICOLOR=1
