.PHONY: install bin zsh git vim starship ghostty

install: bin zsh git vim starship ghostty

bin:
	mkdir -p ~/.local/bin
	stow -t ~/.local/bin bin

zsh:
	stow -t ~ zsh

git:
	mkdir -p ${XDG_CONFIG_HOME}/git
	stow -t ${XDG_CONFIG_HOME}/git git

vim:
	mkdir -p ${XDG_CONFIG_HOME}/vim
	stow -t ${XDG_CONFIG_HOME}/vim vim

starship:
	mkdir -p ${XDG_CONFIG_HOME}
	stow -t ${XDG_CONFIG_HOME} starship

ghostty:
	mkdir -p ${XDG_CONFIG_HOME}/ghostty
	stow -t ${XDG_CONFIG_HOME}/ghostty ghostty
