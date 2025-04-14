INSTALL_PATH = /usr/local/bin
BINARIES = refresh-input-focus im-select ims-mac

install:
	@echo "Installing binaries to $(INSTALL_PATH)..."
	@for binary in $(BINARIES); do \
		sudo install -m 755 $$binary $(INSTALL_PATH)/$$binary; \
	done
	@echo "Installation complete!"

uninstall:
	@echo "Removing binaries from $(INSTALL_PATH)..."
	@for binary in $(BINARIES); do \
		sudo rm -f $(INSTALL_PATH)/$$binary; \
	done
	@echo "Uninstall complete!"

.PHONY: install uninstall
