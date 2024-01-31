#!/bin/sh
args="$(cat /config/args | xargs)"
targets="$(cat /config/targets | xargs)"


echo $(date)
echo $args
echo $targets
echo "Start"
(cd /downloads && /lsiopy/bin/instaloader +/config/args $targets)
echo "End"
