V=20140220

PREFIX = /usr/local

install:
	install -dm755 $(DESTDIR)$(PREFIX)/share/pacman/keyrings/
	install -m0644 msys2{.gpg,-trusted,-revoked} $(DESTDIR)$(PREFIX)/share/pacman/keyrings/

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/share/pacman/keyrings/msys2{.gpg,-trusted,-revoked}
	rmdir -p --ignore-fail-on-non-empty $(DESTDIR)$(PREFIX)/share/pacman/keyrings/

dist:
	git archive --format=tar --prefix=msys2-keyring-$(V)/ $(V) | gzip -9 > msys2-keyring-$(V).tar.gz
	gpg --detach-sign --use-agent msys2-keyring-$(V).tar.gz

upload:
	# scp msys2-keyring-$(V).tar.gz msys2-keyring-$(V).tar.gz.sig nymeria.archlinux.org:/srv/ftp/other/archlinux-keyring/

.PHONY: install uninstall dist upload
