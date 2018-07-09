# Instrumenting BBR

## Using iperf3

iperf3 is a network performance measurement tool. Install the iperf3
using the following commands
Before installing the iperf3, `update` your system using the following
command:

```
$ sudo apt-get update
```

Followed by the command to install `iperf3`:

```
$ sudo apt-get istall iperf3
```

To run the TCP connection over both the machines, follow the given
steps.

To run a connection, one machine needs to be the `server` while the
other needs to be the `client`.

To run the machine as the `server` run the following command:

```
$ iperf3 -s -i 60
```

The `-s` tag will make the machine run as a `server`. The `-i` flag will
specify the interval at which the reports for the throughput shown.

Next you need to know the address of the server to run the other machine
as `client`. To know the ip address of the `server`, run the following
command on the machine you wish to run as the `server`

```
$ ifconfig
```

and check for the `ethernet` ip address, which in my case was
`10.0.0.101`

*NOTE: The command* `ifconifg` *might not always run on every distros of
linux. You can try the following command,* `ip a` *which runs on all the
distros of linux.*

On the other machine (which you wish to run as `client`), run the given
command:

```
$ iperf3 -c 10.0.0.101 -i 0.1 -C bbr -t 6000
```

If running this command gives an error like the one given below:

```
iperf3: error - unable to set TCP_CONGESTION: Supplied congestion control algorithm not supported on this host
```

Then recall that during the kernel build we did not specify BBR as the
default congestion control, so now we need to load the kernel module for
`tcp_bbr`, using the following command:

```
$ sudo modprobe tcp_bbr
```

and run the previous command again, it should work.

## Using ss

We can use `ss` to get information about the kernel about a current TCP
socket.

For example, the following command:

```
$ watch -n 0.1 'echo -n $(date +%s.%N) | tee -a /tmp/test.txt; ss -eipn dst 10.0.0.101 | grep bbr | tee -a /tmp/test.txt'
```

which will:

* run `ss` with arguments to view any established TCP sockets with
	destination 10.0.0.101, and print TCP information about them,
* show only the line that includes the word "BBR" (this is the line we care about)
* "tee" the output to a file as well as to standard out
* also print the timestamp
* and "watch" the output every 0.1 seconds.

The output looks something like this:

```
1528822966.333489404	 ts sack bbr wscale:7,7 rto:204 rtt:0.191/0.02 mss:1448 cwnd:172 ssthresh:166 bytes_acked:1649069960550 segs_out:1138860591 segs_in:32475391 send 10431.7Mbps lastrcv:1507240 pacing_rate 10807.0Mbps unacked:115 rcv_space:29200
```

However, we noticed that more recent versions of `ss` can also print
BBR-specific variables such as BBR's estimate of bandwidth and RTT,
pacing gain, and CWND gain:

```c
        if (s->bbr_info) {
                __u64 bw;

                bw = s->bbr_info->bbr_bw_hi;
                bw <<= 32;
                bw |= s->bbr_info->bbr_bw_lo;

                out(" bbr:(bw:%sbps,mrtt:%g",
                    sprint_bw(b1, bw * 8.0),
                    (double)s->bbr_info->bbr_min_rtt / 1000.0);
                if (s->bbr_info->bbr_pacing_gain)
                        out(",pacing_gain:%g",
                            (double)s->bbr_info->bbr_pacing_gain / 256.0);
                if (s->bbr_info->bbr_cwnd_gain)
                        out(",cwnd_gain:%g",
                            (double)s->bbr_info->bbr_cwnd_gain / 256.0);
                out(")");
      }
```
### Installing ss

Before installing `ss`, run this command to install a dependency. `sudo
apt install libmnl-dev`. (This
is not essentially a *dependency*, but is recommended for *error
support*)
To use a more recent `ss`, download version 4.17:

```
$ wget https://mirrors.edge.kernel.org/pub/linux/utils/net/iproute2/iproute2-4.17.0.tar.gz
$ tar -xzvf iproute2-4.17.0.tar.gz
$ cd iproute2-4.17.0
$ ./configure
$ make
$ sudo make install
```

When we ran it, we noticed that the version of `ss` installed system
wide was still the old one (which we could see from running `ss -v`),
suggesting a problem with the last step - so we ran

```
$ cd misc
$ sudo make install
```

and then verified again. The output of

```
$ /sbin/ss -v
```

should be

```
ss utility, iproute2-ss180608
```

(We also saw that by default, the shell would use the old version of
`ss` installed in `/bin/ss`, so to run the new `ss` you should specify
`/sbin/ss`.)

Now a line of output looks like:

```
1528823737.732173294	 ts sack bbr wscale:7,7 rto:204 rtt:0.185/0.041 mss:1448 pmtu:1500 rcvmss:536 advmss:1448 cwnd:194 ssthresh:166 bytes_acked:2494197764054 segs_out:1722512436 segs_in:49133320 data_segs_out:1722512434 bbr:(bw:11683.9Mbps,mrtt:0.029,pacing_gain:1,cwnd_gain:2) send 12147.5Mbps lastrcv:2278636 pacing_rate 12103.4Mbps delivery_rate 9483.3Mbps busy:2278592ms unacked:162 rcv_space:29200 rcv_ssthresh:29200 notsent:2943944 minrtt:0.019
```

To get this into a nice format for plotting, we can run

```
echo "ts,rto,rtt,rttvar,mtu,pmtu,rcvmss,advmss,cwnd,ssthresh,bytes_acked,segs_out,segs_in,data_segs_out,bbr_bw,bbr_min_rtt,bbr_pacing_gain,bbr_cwnd_gain,send,last_recv,pacing_rate,delivery_rate,busy,unacked" > /tmp/stats.csv
awk -F'[\t/,:() ]'  'BEGIN {OFS=","} {print $1,$10,$12,$13,$15,$17,$19,$21,$23,$25,$27,$29,$31,$33,$37,$39,$41,$43,$46,$48,$50,$52,$54,$56}' /tmp/test.txt >> /tmp/stats.csv
sed -i 's/Mbps/e6/g' /tmp/stats.csv
sed -i 's/Kbps/e3/g' /tmp/stats.csv
```

## Installing and Using R

You can install R through your terminal using the following command:

```
$ sudo apt-get install r-base
```

The you can simply start working with R typing the command `R` in your
terminal.

Once you are in the R terminal, you can run the following commands to
make your plot.

```
> myData <- read.csv("/tmp/stats.csv")
> plot(myData$bbr_bw,mydata$rtt)
```

Please note that the format for the second command is `plot(x,y)`.
