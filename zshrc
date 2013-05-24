# CASE_SENSITIVE="true"
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
# COMPLETION_WAITING_DOTS="true"

[ -e "${HOME}/.zsh_aliases" ] && source "${HOME}/.zsh_aliases"

# [ -e "${HOME}/.zprofile" ] && source "${HOME}/.zprofile"

[ -e "${HOME}/.zshrc_local" ] && source "${HOME}/.zshrc_local"

source /usr/local/lib/node_modules/npm/lib/utils/completion.sh

source "$HOME/.antigen/antigen.zsh"

antigen use oh-my-zsh

# bundles from oh-my-zsh
antigen bundle git
antigen bundle pip
antigen bundle rsync
antigen bundle python
antigen bundle virtualenvwrapper
antigen bundle node
antigen bundle npm
antigen bundle rake
antigen bundle rvm
antigen bundle bundler
antigen bundle zsh-users/zsh-completions src
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle kennethreitz/autoenv
antigen bundle command-not-found
antigen bundle history
antigen bundle tmux
antigen bundle vundle
antigen bundle sprunge
antigen bundle fabric

antigen-theme jreese
antigen-apply

source /usr/local/bin/virtualenvwrapper.sh
