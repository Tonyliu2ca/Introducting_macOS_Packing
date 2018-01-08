#!/bin/bash

projectHome="$HOME/Desktop/myPKGs/Chapter4/EtreCheck"
pkgName="EtreCheck"

if [ "$EUID" -ne 0 ];then echo "Please run as root"; exit; fi

if [ -d "$projectHome" ]; then
	cd "$projectHome"
	#/usr/sbin/chown -R root:wheel root/Applications/Utilities/EtreCheck.app
	#/bin/chmod -R 755  root/Applications/Utilities/EtreCheck.app
	/usr/bin/pkgbuild --root root --identifier "lts.ApplePai.$pkgName" --ownership recommended --quiet "$pkgName.pkg"
	exit 0
else
	echo "Error: Cannot find project folder ($projectHome)."
	exit -1
fi
