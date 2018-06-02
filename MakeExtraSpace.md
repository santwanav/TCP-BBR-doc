# Make Extra Disk Space for Kernel Build
This documentation is an add-on the documentation to compile the linux
kernel module from the source which can be found
[here](https://github.com/santwanaverma15/TCP-BBR-project-documentation/blob/master/Documentation.md#setting-up-and-configuring-the-latest-linux-kernel)

The kernel usually requires a lot of space to build. The kernel in
itself is not of very large size. You can even reduce the size of kernel
*itself* by not selecting the drivers you do not need for yourself.

It is advised to have atleast 4Gb of space on your disk before starting
the kernel build.

You can make an extra filesystem on your disk using the following
command.

```
$ sudo /usr/testbed/bin/mkextrafs /mnt
```

This command will create an extra filesystem on your disk mounted on
`/mnt`.

You can `cd` to `/mnt` and start building the kernel (or any other work
you wanted space for.

```
$ df -h
Filesystem                               Size  Used Avail Use% Mounted on
udev                                      32G     0   32G   0% /dev
tmpfs                                    6.3G  8.9M  6.3G   1% /run
/dev/nvme0n1p1                            16G  2.2G   13G  15% /
tmpfs                                     32G     0   32G   0% /dev/shm
tmpfs                                    5.0M     0  5.0M   0% /run/lock
tmpfs                                     32G     0   32G   0% /sys/fs/cgroup
ops.utah.cloudlab.us:/proj/cloudlab-PG0  100G   24G   77G  24% /proj/cloudlab-PG0
ops.utah.cloudlab.us:/share               97G   10G   80G  12% /share
tmpfs                                    6.3G     0  6.3G   0% /run/user/20001
/dev/nvme0n1p4                           213G   60M  203G   1% /mnt
```

*NOTE: This command will make the filesystem of different sizes every
time you use it on different machines*

The explanation for `df -h` can be found in the documentation mentioned
before.

Cheers!!

Credits:
1. Fraida Fund, NYU
