ROOT=$(realpath .)

all: build

# Generate configuration files
build: submodule .bash_profile

# Install dot files
install: build ~/.rdebugrc
	ln -fs $(ROOT)/.bash_profile ~/.bash_profile
	ln -fs $(ROOT)/tmux.conf ~/.tmux.conf

# Install vim configuration
install_vim:
	cd vim/ && $(MAKE) install

# Generate bash configuration file
.bash_profile: bash_profile.template
	sed "s|##PROJECT_PATH##|$(ROOT)|" bash_profile.template > .bash_profile

# Clone and initialize git submodules
submodule:
	git submodule update --init

~/.rdebugrc: rdebugrc
	ln -s `pwd`/rdebugrc ~/.rdebugrc

# FIXME rdebugrc gemrc

.PHONY: install_vim submodule
