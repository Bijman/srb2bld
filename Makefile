PROG=srb2bld

UNAME := $(shell uname)
ifeq ($(UNAME), Darwin)
    PREFIX = /usr/local/bin
endif
ifeq ($(UNAME), Linux)
ifeq ("$(wildcard $(/usr/local/bin))","")
    PREFIX = /usr/local/bin
else
    PREFIX = /usr/bin
endif
endif

install:
	chmod 755 $(PROG)
	mkdir -p ${DESTDIR}${PREFIX}
	install ${PROG} ${DESTDIR}${PREFIX}/${PROG}

uninstall:
	rm -f ${DESTDIR}${PREFIX}/${PROG}

.PHONY: install uninstall
