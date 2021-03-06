_byobu_sourced=1 . /usr/bin/byobu-launch

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
[[ -e /usr/local/texlive/2012/bin ]] && PATH=/usr/local/texlive/2012/bin/x86_64-linux:$PATH

export WINEPREFIX=$HOME/wine32
export WINEARCH=win32
export PAGER="most"
export PATH=~/.rbenv/shims:~/bin:~/.local/bin:$PATH
export JAVA_HOME=/usr/lib/jvm/java-7-oracle/jre
export WORKON_HOME=~/envs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
export EDITOR='vim'
export ECHO_NEST_API_KEY="VNK6GON9BTILAZSLM"
eval "$(rbenv init -)"
