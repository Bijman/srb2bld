PROG=srb2bld
PREFIX = /usr/local

install:
	chmod 755 $(PROG)
	mkdir -p ${DESTDIR}${PREFIX}/bin
	install ${PROG} ${DESTDIR}${PREFIX}/bin/${PROG}

uninstall:
	rm -f ${DESTDIR}${PREFIX}/bin/${PROG}

.PHONY: install uninstall
