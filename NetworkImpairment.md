# Add Delay, Rate Limit or both

## Adding delay to the network using the netem
```
sudo tc qdisc replace dev eno1d1 root handle 1:0 tbf rate 100mbit limit 1.25Mb burst 32kB; sudo tc qdisc add dev eno1d1 parent 1:1 handle 10: netem delay 10ms
```

*NOTE: The overall delay here is 10ms. This experiment had two links
between the sender and receiver, each with a delay of 10ms, making the
overall delay of 20ms.*

Also remember to restore back to original once the work is done using
the following command.

```
sudo tc qdisc del dev eth2 root handle 1:0
```

## Emulating loss in the network

We can emulate loss in a wide area network much like the delay is added.
Use the following command to add `0.5%`loss (i.e 5 packets will be
lost for every 1000 packets transmitted.

```
sudo tc qdisc replace dev eth2 root handle 1:0 tbf rate 100mbit limit 1.25Mb burst 32kB; sudo tc qdisc add dev eth2 parent 1:1 handle 10: netem loss 0.5%
```
## tbf

## netem

## Resources

* [Effect of router buffer size on RTT fairness of high speed TCP
		variants](https://witestlab.poly.edu/blog/effect-of-buffer-size-on-rtt-fairness/)

