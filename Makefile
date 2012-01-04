# Makefile for frugalware-menus
# Copyright (C) 2012 Devil505

NAME=frugalware-menus
VERSION=0.6

all:

install: 
	install -d $(DESTDIR)/usr/share/desktop-directories
	install -d $(DESTDIR)/usr/share/applications
	
	install -m0644 data/*.desktop $(DESTDIR)/usr/share/applications/
	install -m0644 data/Frugalware.directory $(DESTDIR)/usr/share/desktop-directories/
dist:
	git archive --format=tar --prefix=${NAME}-${VERSION}/ HEAD | tar xf -
	git log --no-merges |git name-rev --tags --stdin > ${NAME}-${VERSION}/ChangeLog
	tar czf ${NAME}-${VERSION}.tar.gz ${NAME}-${VERSION}
	rm -rf ${NAME}-${VERSION}
