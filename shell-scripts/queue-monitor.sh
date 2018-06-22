#!/bin/bash

# run with input File as first argument and output file as the second arg

echo "ts, Backlog in Bytes, Backlog in packets" > "$2"
while read line
do
		dat=$(echo -e "$line" | awk -F '[/ :\t)]' 'BEGIN {OFS=",";} {print $1, $33, $34;}'  | sed -e 's/b//g' | sed -e 's/p//g')
		echo "$dat" >> "$2"
		echo "$ts $line" >> "$2.debug"
		sleep 0.001
	sleep 0.001
done < "$1"

