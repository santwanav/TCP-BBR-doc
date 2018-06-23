#! /bin/bash

echo "ts,rto,rtt,rttvar,mss,pmtu,rcvmss,advmss,cwnd,bytes_acked,segs_out,segs_in,data_segs_out,bbr_bw,bbr_min_rtt,bbr_pacing_gain,bbr_cwnd_gain,send,pacing_rate,delivery_rate,busy" > "$1"

while :
do
	line=$(ss -eipn | grep bbr)
	if [ ! -z "$line" ]; then
		ts=$(date +%s.%N)
		dat=$(echo -e "$ts\t$line"  | sed -e 's/app_limited.*b//' | sed -e 's/unacked.*r//' | sed -e 's/last.*pacing_//' | sed -e 's/ssthresh.*bytes//' | awk -F '[/ ,:\t)]' 'BEGIN {OFS=",";} {print $1, $11, $13, $14, $16, $18, $20, $22, $24, $26, $28, $30, $32, $35, $37, $39, $41,  $44, $46, $48, $50;}' | sed -e 's/Mbps/e6/g' | sed -e 's/Kbps/e3/g')
		echo "$dat" >> "$1"
		echo "$ts $line" >> "$1.debug"
		sleep 0.001
	fi
	sleep 0.001
done
