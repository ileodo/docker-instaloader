#!/bin/sh
args="$(cat /config/args | xargs)"

echo $(date)
echo "Start"
(cd /downloads && /lsiopy/bin/instaloader +/config/args)
echo "End"
