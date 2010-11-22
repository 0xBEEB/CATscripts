#!/usr/bin/env bash

# This is ubiquill's super simple print script.
# Usage of this script is permitted, but buying beer for its author is
# strongly suggested.

# Why mess with awk and sed when you can just plug the files to be checked into
# a txt document and redirect that to this script. Done and done.

# Oh, but wait ... You say you want to mess with awk and sed. All you have to do
# is pipe the output to this script. Bash++

INFO="This is a test printed by ubiquill at "

for i in $*
do
echo $INFO `date`  " " $i > .print.tmp
cat ./testpage >> .print.tmp
lpr -P $i .print.tmp
done

rm -f .print.tmp
