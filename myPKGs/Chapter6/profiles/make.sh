#!/bin/bash

projectHome="$HOME/Desktop/myPKGs/Chapter6/profiles"
pkgName="profiles"
pkgVersion="1.0"

if [ "$EUID" -ne 0 ];then echo "Please run as root"; exit; fi

if [ -d "$projectHome" ]; then
	cd "$projectHome"
	/usr/bin/pkgbuild --nopayload --scripts scripts --identifier "lts.ApplePai.$pkgName" \
		--version $pkgVersion --quiet "$pkgName-$pkgVersion.pkg"
	exit 0
else
	echo "Error: Cannot find project folder ($projectHome)."
	exit -1
fi
