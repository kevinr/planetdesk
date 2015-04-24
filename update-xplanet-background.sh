#!/bin/bash

DATE=`date +%Y%m%d%H%M%S`
XPLANET_DESKTOP_FILE_FORMAT=png
XPLANET_DESKTOP_FILE_LOCATION=$HOME/xplanet-desktop
XPLANET_DESKTOP_FILE=${XPLANET_DESKTOP_FILE_LOCATION}.${DATE}.${XPLANET_DESKTOP_FILE_FORMAT}
CLOUDS_FILE=$HOME/.xplanet/images/clouds_4096.jpg
CLOUDS_LOG=$CLOUDS_FILE.log

LATITUDE=30
LONGITUDE=-71.090
RADIUS=100
GEOMETRY=1440x900

#$HOME/bin/download_clouds.py $CLOUDS_FILE 2>&1 | tee -a $CLOUDS_LOG

# expects user/pass in XPLANETCLOUDS_USER and XPLANETCLOUDS_PASS env vars
$HOME/bin/download_clouds.sh 2>&1 | tee -a $CLOUDS_LOG

rm ${XPLANET_DESKTOP_FILE_LOCATION}.*.${XPLANET_DESKTOP_FILE_FORMAT}
xplanet -config bump -origin earth -latitude $LATITUDE -longitude $LONGITUDE -radius $RADIUS -geometry $GEOMETRY -num_times 1 -output $XPLANET_DESKTOP_FILE

### Gnome
#gconftool-2 --type string --set /desktop/gnome/background/picture_filename "$XPLANET_DESKTOP_FILE"

### XFCE
#Fetch the PID
pid=$(ps -C xfce4-session -o pid=)
#Hack to remove the leading space. Maybe not so nice, but it works.
pid=$(echo $pid)
#Get the environment variable from /proc
export $(grep -z DBUS_SESSION_BUS_ADDRESS /proc/$pid/environ)
# xfce4-desktop won't update the background unless the filename changes, so we force a unique filename
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorLVDS1/workspace0/last-image -s $XPLANET_DESKTOP_FILE
