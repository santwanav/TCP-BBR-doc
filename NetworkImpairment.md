# Add Delay, Rate Limit or both

```
sudo tc qdisc replace dev eno1d1 root handle 1:0 tbf rate 100mbit limit 1.25Mb burst 32kB; sudo tc qdisc add dev eno1d1 parent 1:1 handle 10: netem delay 10ms
```

## tbf

## netem

