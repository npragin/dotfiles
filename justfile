os := `uname -s`
repo_dir := justfile_directory()

default: bin zsh git vim starship ghostty packages

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
	mkdir -p ${XDG_STATE_HOME}/vim/undo
	mkdir -p ${XDG_STATE_HOME}/vim/swap
	mkdir -p ${XDG_STATE_HOME}/vim/backup
	stow -t ${XDG_CONFIG_HOME}/vim vim

starship:
	mkdir -p ${XDG_CONFIG_HOME}
	stow -t ${XDG_CONFIG_HOME} starship

ghostty:
	mkdir -p ${XDG_CONFIG_HOME}/ghostty
	stow -t ${XDG_CONFIG_HOME}/ghostty ghostty

packages:
	#!/usr/bin/env bash
	set -euo pipefail
	if [[ "{{os}}" == "Darwin" ]]; then
		just brew
	else
		just linux-packages
	fi

brew:
	mkdir -p ${XDG_CONFIG_HOME}/homebrew
	stow -t ${XDG_CONFIG_HOME}/homebrew homebrew
	brew bundle install --file=${XDG_CONFIG_HOME}/homebrew/Brewfile

linux-packages:
	#!/usr/bin/env bash
	set -euo pipefail
	echo "==> Setting up Flatpak for GUI applications..."
	if ! command -v flatpak &> /dev/null; then
		echo "Installing Flatpak..."
		sudo apt install -y flatpak
		flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
		echo "Flatpak installed. You may need to restart your session."
	else
		echo "Flatpak already installed."
	fi
	echo "==> Installing Flatpak applications..."
	grep -v '^#' "{{repo_dir}}/apt/flatpak.txt" | grep -v '^$' | while read -r app; do
		echo "Installing $app..."
		flatpak install -y flathub "$app" || echo "Warning: Failed to install $app"
	done
	echo "==> Installing Homebrew packages (formulae)..."
	just brew
	echo ""
	echo "==> Package installation complete!"
	echo "Note: For manual installations (Zinit, Miniforge, etc.), see apt/manual.txt"
