#!/bin/bash

XPLANET_DESKTOP_FILE=$HOME/xplanet-desktop.png
CLOUDS_FILE=$HOME/.xplanet/images/clouds_4096.jpg

LATITUDE=30
LONGITUDE=-71.090
RADIUS=100
GEOMETRY=1440x900

$HOME/bin/download_clouds.py $CLOUDS_FILE
xplanet -config bump -origin earth -latitude $LATITUDE -longitude $LONGITUDE -radius $RADIUS -geometry $GEOMETRY -num_times 1 -output $XPLANET_DESKTOP_FILE
gconftool-2 --type string --set /desktop/gnome/background/picture_filename "$XPLANET_DESKTOP_FILE"
