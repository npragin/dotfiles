default: bin zsh git vim starship ghostty brew cursor

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

brew:
	mkdir -p ${XDG_CONFIG_HOME}/homebrew
	stow -t ${XDG_CONFIG_HOME}/homebrew homebrew
	brew bundle install --file=${XDG_CONFIG_HOME}/homebrew/Brewfile

cursor:
    mkdir -p ${XDG_CONFIG_HOME}/cursor
    mkdir -p "${HOME}/Library/Application Support/Cursor/User"
    mkdir -p "${HOME}/Library/LaunchAgents"
    stow -t ${XDG_CONFIG_HOME}/cursor cursor
    ln -sf "${XDG_CONFIG_HOME}/cursor/settings.json" "${HOME}/Library/Application Support/Cursor/User/settings.json"
    sed "s|__HOME__|${HOME}|g" "${XDG_CONFIG_HOME}/cursor/com.cursor.extensions-watch.plist.tmpl" > "${HOME}/Library/LaunchAgents/com.cursor.extensions-watch.plist"
    launchctl bootout gui/$(id -u) "${HOME}/Library/LaunchAgents/com.cursor.extensions-watch.plist" || true
    launchctl bootstrap gui/$(id -u) "${HOME}/Library/LaunchAgents/com.cursor.extensions-watch.plist"
    while IFS= read -r ext; do \
        [[ -z "$ext" || "$ext" == \#* ]] && continue; \
        cursor --install-extension "$ext"; \
    done < "${XDG_CONFIG_HOME}/cursor/extensions.txt"
