.PHONY: install bin zsh git vim

install: bin zsh git vim

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
