#!/bin/sh
#Try to run with prima WLAN driver
# Wifi firmware reload path
MAXTRIES=15
i=1
while [ ! $i -gt $MAXTRIES ]  ; do
    rfkill unblock all
#chown wifi wifi /sys/module/wlan/parameters/fwpath
echo 1 > /dev/wcnss_wlan
echo sta > /sys/module/wlan/parameters/fwpath

    sleep 1
    if [ $i == $MAXTRIES ] ; then
        # must have gotten through all our retries, fail
        exit 1
    fi
done
rfkill unblock all
ifconfig wlan up
