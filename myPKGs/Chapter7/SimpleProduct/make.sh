#!/bin/bash

projectHome=$(dirname "$0")
pkgName="SimpleProduct"
pkgVersion="1.0"
pkgsFolder="pkgs"

if [ "$EUID" -ne 0 ];then echo "Please run as root"; exit; fi

if [ -d "$projectHome" ]; then
	cd "$projectHome"
	[ -d "./build" ] || mkdir ./build
	/usr/bin/productbuild --package "$pkgsFolder/initialize-1.0.pkg"\
		--package "$pkgsFolder/loginwallpaper-1.0.pkg"\
		--package "$pkgsFolder/profiles-1.0.pkg"\
		"build/$pkgName-$pkgVersion.pkg"

	exit 0
else
	echo "Error: Cannot find project folder: $projectHome."
	exit -1
fi
