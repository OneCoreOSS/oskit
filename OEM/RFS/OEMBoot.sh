#!/bin/sh

### BACKGROUND SVCS : INSTALL OPENSSL, CA-CERTIFICATES, APK ###

echo "   -> Starting install for OPENSSL"
tce-load -i "/etc/OneCore/OEM/openssl.tcz"
echo "   -> Starting install for CA-CERTIFICATES"
tce-load -i "/etc/OneCore/OEM/ca-certificates.tcz"
echo "   -> Starting install for APK"
tce-load -i "/etc/OneCore/OEM/apk.tcz"

