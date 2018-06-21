# Add Delay, Rate Limit or both

```
sudo tc qdisc replace dev eno1d1 root handle 1:0 tbf rate 100mbit limit 1.25Mb burst 32kB; sudo tc qdisc add dev eno1d1 parent 1:1 handle 10: netem delay 10ms
```

## Installing the iperf3 from the source
*NOTE: This has been taken from a blog, the link for which is given the
resources section.*

```
$ git clone https://github.com/esnet/iperf.git
```

In the `iperf` directory, execute the following commands

```
$ ./bootstrap.sh
$ ./configure
$ make
$ sudo make install
$ sudo ldconfig
```
This will install the `iperf` to your machine. You can check the version
by the following command:


## tbf

## netem

## Resources

* [Effect of router buffer size on RTT fairness of high speed TCP
		variants](https://witestlab.poly.edu/blog/effect-of-buffer-size-on-rtt-fairness/)

