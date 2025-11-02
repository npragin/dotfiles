.PHONY: install bin zsh git vim starship

install: bin zsh git vim starship

bin:
	mkdir -p ~/.local/bin
	stow -t ~/.local/bin bin

zsh:
	stow -t ~ zsh

git:
	mkdir -p ~/.config/git
	stow -t ~/.config/git git

vim:
	mkdir -p ~/.config/vim
	stow -t ~/.config/vim vim

starship:
	mkdir -p ~/.config
	stow -t ~/.config starship
