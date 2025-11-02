.PHONY: install bin

install: bin

bin:
	mkdir -p ~/.local/bin
	stow -t ~/.local/bin bin

