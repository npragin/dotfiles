.PHONY: install bin zsh git

install: bin zsh git

bin:
	mkdir -p ~/.local/bin
	stow -t ~/.local/bin bin

zsh:
	stow -t ~ zsh

git:
	mkdir -p ~/.config/git
	stow -t ~/.config/git git
