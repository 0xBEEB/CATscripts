#!/usr/bin/env bash
#########################################################
# chromecache.sh
#
# Copyright 2010 by Thomas Schreiber <ubiquill@gmail.com>
# 
# Silly Google! I have limited space and I would like to
# keep my Chromium cache at a sane level. This script
# does that for me until this feature is added to the
# browser.
#
# MAKE SURE CHROMIUM IS NOT RUNNING WHEN THIS SCRIPT
# IS RUN!!!!!
#########################################################

CHROMEDIR=$HOME/.cache/chromium/Cache
COUNTER=0
MAXCACHE=150

while [ `du $CHROMEDIR | cut -f1` -gt $MAXCACHE ]; do
	for i in `ls -a $CHROMEDIR -t | tail`;
	do
		rm $CHROMEDIR/$i
		COUNTER+=1
	done
done

echo Deleted $COUNTER items
