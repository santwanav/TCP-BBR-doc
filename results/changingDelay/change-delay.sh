#!/bin/bash

if [ "$#" -ne 2]; then
	echo "Arguments expected: 2, found: "$#""
	echo "usage:"
	echo "Argument(1): name of first interface"
	echo "Argument(2): name of another interface"
	exit 1
fi
# arguments expected: 2, Both being the name of the network you wish to apply delay on. The following script will follow the cycle of [10ms, 20ms, 30ms, 40ms, 50ms, 60ms, 50ms, 40ms, 30ms, 20ms, 10ms] each changing after 10secs of run with a give delay, lasting for a total duration of 110secs.

i=0
array=(5 10 15 20 25 30 25 20 15 10 5)
while [ $i -lt 11 ]
do
	sudo tc qdisc del dev "$1" root handle 1:0
	sudo sudo tc qdisc replace dev "$1" root handle 1:0 tbf rate 100mbit limit 1.25Mb burst 32kB; sudo tc qdisc add dev $1 parent 1:1 handle 10: netem delay ${array[i]}
	sudo tc qdisc del dev "$2" root handle 1:0
	sudo sudo tc qdisc replace dev "$2" root handle 1:0 tbf rate 100mbit limit 1.25Mb burst 32kB; sudo tc qdisc add dev $2 parent 1:1 handle 10: netem delay ${array[i]}
	i=$[i+1]
	sleep 10




