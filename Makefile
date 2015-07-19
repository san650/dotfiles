all:

install: vim

# Install vim configuration
vim: submodule
	cd vim/ && $(MAKE) install

# Clone and initialize git submodules
submodule:
	git submodule update --init

.PHONY: vim submodule
