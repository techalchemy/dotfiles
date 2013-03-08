# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
export PATH=~/bin:~/.local/bin:$PATH
export JAVA_HOME=/usr/lib/jvm/java-6-openjdk-amd64/jre
export WORKON_HOME=~/envs
export EDITOR='vim'
export ECHO_NEST_API_KEY="VNK6GON9BTILAZSLM"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="jreese"

# Example aliases
alias zshconfig="edit ~/.zshrc"
alias ohmyzsh="edit ~/.oh-my-zsh"
alias diff="colordiff"
alias df="df -H"
alias du="du -ch"
alias ls="ls --color=auto"
alias update="sudo apt-get update && sudo apt-get upgrade"
alias install="sudo apt-get install"
# alias su="sudo -i"
alias myip="wget http://nwdesign.us/myip.php -O - -q ; echo"
alias webserver="python -m SimpleHTTPServer"

#function cd {
    #builtin cd "$@"
    #ENVFILE=".venv"
    #if [ -f "$ENVFILE" ] ; then
        #ENVPATH=$(<$ENVFILE)
        #workon "$ENVPATH"
    #fi
#}

man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
            man "$@"
}
# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rsync python screen pip virtualenvwrapper node)

[ -e "${HOME}/.zshrc_local" ] && source "${HOME}/.zshrc_local"

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
source /usr/local/bin/virtualenvwrapper.sh

PATH=$PATH:/usr/local/rvm/bin # Add RVM to PATH for scripting
