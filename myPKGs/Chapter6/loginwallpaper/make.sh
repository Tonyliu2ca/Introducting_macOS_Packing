#!/bin/bash

projectHome="$HOME/Desktop/myPKGs/Chapter6/loginwallpaper"
pkgName="loginwallpaper"
pkgVersion="1.0"

if [ "$EUID" -ne 0 ];then echo "Please run as root"; exit; fi

if [ -d "$projectHome" ]; then
	cd "$projectHome"
	/bin/chmod a+r "$projectHome/Caches/com.apple.desktop.admin.png"
	/usr/sbin/chown root:admin "$projectHome/Caches/com.apple.desktop.admin.png"
	/usr/bin/pkgbuild --root Caches --install-location "/Library/Caches" \
		--scripts scripts --identifier "lts.ApplePi.$pkgName" --version $pkgVersion \
	    --ownership recommended --quiet "$pkgName-$pkgVersion.pkg"
	exit 0
else
	echo "Error: Cannot find project folder ($projectHome)."
	exit -1
fi
