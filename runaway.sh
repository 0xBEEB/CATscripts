#!/usr/bin/env bash

rm -f .runaway .runrunrun .runaway.temp1 .runaway.temp2 .runaway.temp3

for i in $*
do
    ssh $i ps -eo pcpu,pid,user,args > .runrunrun

    while read line
    do
        firstcol=`echo "$line" | cut -d\  -f1`
        if [ "$firstcol" != '-' ]; then
            echo -e "$line" "\t" "$i\n" >> .runaway.temp1
        fi
    done < .runrunrun

    cat .runaway.temp1 | sort -k 1 -r | head -11 | tail -10 > .runaway.temp2

    
done

echo -e "cpu\tpid\tuser\targs\thost" > .runaway

cat .runaway.temp2 >> .runaway

cat .runaway
