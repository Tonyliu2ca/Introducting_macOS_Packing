#!/bin/bash

projectHome="$HOME/Desktop/myPKGs/Chapter6/other_scrippts"
pkgName="pkgScripts"
pkgVersion="1.0"

if [ "$EUID" -ne 0 ];then echo "Please run as root"; exit; fi

if [ -d "$projectHome" ]; then
	cd "$projectHome"
	#/usr/sbin/chown -R root:wheel root/Applications/Utilities/EtreCheck.app
	#/bin/chmod -R 755  root/Applications/Utilities/EtreCheck.app
	#/bin/chmod -R a+x "$projectHome/scripts"
	/usr/bin/pkgbuild --nopayload --scripts scripts --identifier "lts.ApplePai.$pkgName" --version $pkgVersion --quiet "$pkgName-$pkgVersion.pkg"
	exit 0
else
	echo "Error: Cannot find project folder ($projectHome)."
	exit -1
fi
