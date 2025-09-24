#!/bin/sh

while true; do
	sleep 3
	if [ ! -f /usr/local/bin/limine ]; then
		tce-load -i "/etc/OneCore/OEM/limine.tcz"
	fi
done
