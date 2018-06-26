# Utilities Used During the Experiment

## Linux Commands

```
tee
```
Tee is used to write to a file as well as to the stdout. It can also be
said that `tee` duplicates its input to multiple output.

```
grep
```
One of the most useful commands of linux imo. `grep` searches for PATTERN in each FILE. If no FILE is given, recursive searches examine the 
working directory, and nonrecursive searches read standard input. By default, grep prints the matching lines.

## Linux Network Utilities


###  ss

ss is used to monitor the network statistics, giving more information
about TCP than `netstat`.


### iperf

#### Installing the iperf3 from the source
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

This will install the `iperf` to your machine. You can check the version by the following command:



### netem

`netem` allows to emulate network conditions similar to those of a
wide-area networks. The main purpose for my usage of `netem` was to
emulate `packet loss` and `delay` in the network conditions. The full
documentation of the same can be found
[here](https://wiki.linuxfoundation.org/networking/netem)

```
tbf
tc
```


## Documentation Utilities

```
pandoc
beamer
```

## Other Linux Utilities

```
screen
awk
sed
```
The must learn tool!

```
The power of $
```


# Terminal Used

```
terminator
```
Terminator is a terminal which I liked for its split feature, both
horizontally and vertically.


# Shell Used

```
fish
```

fish is a user-friendly which I personally liked for its text
completion feature which grows smarter the more you use it.

*Note: You can change the default shell of your system by using the
following command* `chsh -s <shell-name>`. *Here the shell name for me
was* `fish`.


Resources:
* [Tee](https://www.computerhope.com/unix/utee.html)
* [Grep](http://man7.org/linux/man-pages/man1/grep.1.html)
* [ss](https://linux.die.net/man/8/ss)

