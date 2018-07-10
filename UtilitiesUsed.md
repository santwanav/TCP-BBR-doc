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

#### Installing ss

Before installing `ss`, run this command to install a dependency. `sudo apt install libmnl-dev`. (This is not essentially a *dependency*, but is recommended for *error support*)
To use a more recent `ss`, download version 4.17:
```
 wget https://mirrors.edge.kernel.org/pub/linux/utils/net/iproute2/iproute2-4.17.0.tar.gz
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

We noticed that the terminal still uses the older version of ss. Please
send a PR if you find a fix.

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

Some of the shortcuts for terminator are as follows:
* `Ctrl+D`: Close the current terminal.
* `Ctrl+X`: Toggle between maximize the current terminal and restore all
the terminals.
* `Ctrl+Shift+E`: Split the terminal vertically.
* `Ctrl+Shift+O`: Split the terminal horizontally.

# Shell Used

```
fish
```

fish is a user-friendly which I personally liked for its text
completion feature which grows smarter the more you use it.

*Note: You can change the default shell of your system by using the
following command* `chsh -s <shell-name>`. *Here the shell name for me
was* `fish`.

# Some tips

* Some files require to be edited in the sudo mode.If you forgot to open
the file using sudo in `vim` and started editing it, use the following command
while saving your file to avoid any hassle:

```
:w !sudo tee %
```
and then exit the file.

* If your ssh terminal is hung, press `enter` followed by `~` and `.`.
		It closes the ssh terminal and you can begin anew.

Resources:

* [Tee](https://www.computerhope.com/unix/utee.html)
* [Grep](http://man7.org/linux/man-pages/man1/grep.1.html)
* [ss](https://linux.die.net/man/8/ss)

