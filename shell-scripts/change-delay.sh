#! /bin/bash

if [ "$#" -ne 2 ]; then
	echo "Arguments expected: 2, Argument(s) found: "$#""
	echo "Usage:"
	echo "Argument 1: interface 1"
	echo "Argument 2: interface 2"
	exit 1
fi

interface1=$1
interface2=$2

# start thee array counter
i="0"
ms="ms"

# make an array to add subsequent delays
delays=(5 10 15 20 25 30 25 20 15 10 5)


while [ $i -lt 11 ]
do
#	echo $i
	echo "delay ${delays[$i]}$ms"
	sudo tc qdisc del dev "$interface1" root handle 1:0
	sudo tc qdisc replace dev "$interface1" root handle 1:0 tbf rate 100mbit limit 1.25Mb burst 32kB; sudo tc qdisc add dev "$interface1" parent 1:1 handle 10: netem delay "${delays[$i]}$ms"
	sudo tc qdisc del dev "$interface2" root handle 1:0
	sudo tc qdisc replace dev "$interface2" root handle 1:0 tbf rate 100mbit limit 1.25Mb burst 4kB; sudo tc qdisc add dev $interface2 parent 1:1 handle 10: netem delay "${delays[$i]}$ms"
	i=$((i+1))
	sleep 10
done
