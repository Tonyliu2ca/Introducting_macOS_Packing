#!/bin/bash

projectHome="$HOME/Desktop/myPKGs/Chapter5/dockutil"
pkgName="installDockutil"
pkgVersion="1.0"

if [ "$EUID" -ne 0 ];then echo "Please run as root"; exit; fi

if [ -d "$projectHome" ]; then
	cd "$projectHome"
	#/usr/sbin/chown -R root:wheel root/Applications/Utilities/EtreCheck.app
	/bin/chmod -R a+x "$projectHome/root/bin/dockutil"
	/usr/sbin/chown root:admin "$projectHome/root/bin/dockutil"
	/bin/chmod -R a+x "$projectHome/scripts"
	/usr/bin/pkgbuild --root root --install-location "/usr/local" \
		--scripts scripts --identifier "lts.ApplePai.$pkgName" \
		--version $pkgVersion  --ownership recommended \
		--quiet "$pkgName-$pkgVersion.pkg"
	exit 0
else
	echo "Error: Cannot find project folder ($projectHome)."
	exit -1
fi
