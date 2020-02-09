PREFIX?=/usr/local

OSNAME=${shell uname -s}

build:
	swift build -c release

install: build
	mkdir -p $(PREFIX)/bin
	cp -f .build/release/SUTI $(PREFIX)/bin/suti
