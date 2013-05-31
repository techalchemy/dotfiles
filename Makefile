backup_root = $(HOME)/backup/dotfiles
date := $(shell date --iso=date)
target_prefix := $(HOME)/.
repo_dir:=`[ "dotfiles" = "$(notdir $(CURDIR))" ] && echo $(CURDIR) || echo $(CURDIR)/dotfiles`
repo_url = https://github.com/techalchemy/dotfiles.git

direct_links := antigen \
			   byobu \
			   config/fontconfig \
			   config/powerline \
			   editorconfig \
			   fonts \
			   gitconfig \
			   gitignore \
			   npmrc \
			   vim \
			   vimrc \
			   zprofile \
			   zsh_aliases \
			   zshrc

target_links := $(addprefix, $(target_prefix), $(direct_links))
source_path = "$(addprefix $(repo_dir)/,$(1))"
link_to = "$(addprefix $(target_prefix),$(1))"
current_rpath = "$(call fullpath, $(target_prefix),$(1))"
gitmodules = vim \
			 antigen

backup_dir := $(backup_root)/$(date)

# Helper variable for pulling up to the first whitespace
empty:=
space:= $(empty) $(empty)
equals:= \=


# Invoked as: $(call fullpath prefix path) and returns resolved path across symlinks etc
fullpath=$(realpath $(wildcard $(if $(2),$(addprefix $(1),$(2)),$(addprefix ,$(1)))))

sync_repo = cd $(repo_dir) && \
			git checkout master && \
			git pull origin master && \
			git submodule sync && \
			git submodule update --init --recursive && \
			git submodule update --recursive && \
			git submodule foreach "git checkout master && git pull origin master"

sync_submodule = cd $(repo_dir)/$(1) && \
				 $(call sync_repo) && \
				 git submodule update --init --recursive

symlink = echo "Symlinking from $(1) -> $(2)\n" && $(if $(wildcard "$(2)"),$(1),$(shell ln -s $(1) $(2)) && $(1))

# backup_file, target_path, new_source
backup_file = mkdir -p $(backup_dir) && \
			  [ -e $(1) ] && mv $(1) $(backup_dir) && \

.PHONY: clean
clean:
		rm -rf *.stamp

.PHONY: setup
setup:
		@git clone $(repo_url)

.PHONY: fresh_repo.stamp
fresh_repo.stamp:
		$(call sync_repo)
		@touch fresh_repo.stamp

.PHONY: fresh_submods.stamp
fresh_submods.stamp: fresh_repo.stamp
		$(foreach repo,$(gitmodules),$(call sync_submodule,$(repo)))
		@touch fresh_submods.stamp

.PHONY: update
update: fresh_repo.stamp fresh_submods.stamp vim_update

.PHONY: uninstall
uninstall: clean
		rm -rf $(repo_dir)

.PHONY: fonts
fonts: links
	fc-cache -vf $(call link_to,fonts)

.PHONY: vim_install
vim_install: fonts
	vim +BundleInstall +qall $(repo_path)/README.md

.PHONY: vim_update
vim_update:
	vim +BundleUpdate +qall $(repo_path)/README.md

.PHONY: vim
vim: vim_install

.PHONY: $(direct_links)
	@mkdir -p "$(addprefix $(target_prefix),$(dir $@))"
	@new_src="$(call source_path,$@)" && \
	ln_targ="$(call link_to,$(@))" && \
	echo "Found target: $$ln_targ \n" && \
	if [ -e "$$ln_targ" ]; then \
			echo "Backing up $$ln_targ \n" && \
			$(call backup_file,$$ln_targ); \
	fi && \
	echo "Creating symbolic link: $$new_src -> $$ln_targ" && \
	ln -s $$new_src $$ln_targ

.PHONY: links
links: $(direct_links)

.PHONY: init
init: setup update links
