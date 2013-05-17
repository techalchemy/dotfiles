_byobu_sourced=1 . /usr/bin/byobu-launch

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "/usr/local/rvm/scripts/rvm" # Load RVM into a shell session *as a function*

source "$HOME/.antigen.zsh"

antigen-lib
antigen-bundles <<EOBUNDLES

pip
# Guess what you need to install if command not found
command-not-found
git
rsync
python
virtualenvwrapper
node
npm
rake
rvm
ruby
bundler
zsh-users/zsh-completions src
zsh-users/zsh-syntax-highlighting
kennethreitz/autoenv

EOBUNDLES

antigen-theme jreese
antigen-apply

alias lh='ls -l .??*'
alias lhd='ls -ld .??*'

export WINEPREFIX=$HOME/wine32
export WINEARCH=win32
export PATH=/usr/local/texlive/2012/bin/x86_64-linux:$PATH
export PAGER="most"
