Dotfiles
#########

These dotfiles are designed to work with ZSH.  See the configuration files
themselves for more specific dependencies and requirements.

For now, simply:

```
$ git clone https://github.com/techalchemy/dotfiles.git
$ cd dotfiles
$ git submodule update --init --recursive
$ ln -s .zshrc ~/.zshrc
```

Repeat this process as many times as necessary to link the dotfiles you want
to your home directory.
