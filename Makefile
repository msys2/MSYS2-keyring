PREFIX = /usr/local

install:
	install -dm755 $(DESTDIR)$(PREFIX)/share/pacman/keyrings/
	install -m0644 msys2.gpg $(DESTDIR)$(PREFIX)/share/pacman/keyrings/
	install -m0644 msys2-trusted $(DESTDIR)$(PREFIX)/share/pacman/keyrings/
	install -m0644 msys2-revoked $(DESTDIR)$(PREFIX)/share/pacman/keyrings/

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/share/pacman/keyrings/msys2{.gpg,-trusted,-revoked}
	rmdir -p --ignore-fail-on-non-empty $(DESTDIR)$(PREFIX)/share/pacman/keyrings/

.PHONY: install uninstall
