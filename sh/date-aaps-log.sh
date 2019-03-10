#!/bin/sh
# Rather simple way of determining the date of the first and last sgv in an AAPS logfile to
# help determine the order of fragments.
# Sample line examined:
# 00:00:18.798 [NSClientServiceHandler] DEBUG [NSClientPlugin.onStatusEvent():160]: LAST 3/2/19 00:00

# Takes a single (unzipped) logfile as argument

echo "from " `grep onStatusEvent $1 |grep LAST |head -1 | sed -e "s/ .*LAST//"`
echo "to   " `grep onStatusEvent $1 |grep LAST |tail -1 | sed -e "s/ .*LAST//"`
