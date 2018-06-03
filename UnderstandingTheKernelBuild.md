# Understanding the kernel build process
This documentation will focus on the processes taking place in the
background during a kernel build.

This document will go over the main steps of building a kernel ( *NOTE:
It is assumed that the reader is well aware of the usage of basic linux
commands like* `cd`, `uname -r`, `nproc` *etc. Also the explanation of commands
like* `du` *and* `df` *shall also not be provided in this document. But the
links for the same can be found in the resources section.*)

After extracting the linux kernel archive, the steps begin with running
the following command inside the folder:

```
$ sudo make
```

The `make` command compiles the kernel and links the kernel image to a file
named `vmlinuz` ( **V**irtual **M**emory **Linu**x g<strong>Z</strong>ip ). The instructions on how to do so are in the `Makefile`.

*What is* <strong>vmlinuz</strong> <em>?</em>

`vmlinuz` is the <em>compressed</em> executable file for the kernel
which is bootable.

The next step is

```
$ sudo make modules_install
```

This command will compile the modules, make the binaries and will
load the modules to the `modules` directory of the kernel.

*NOTE: Some tutorials suggest running* `make modules` *before running*
`make modules_install`. *The* `make modules` *command will first compile
the modules and save the binaries in the directory. Then the* `make
modules_install` *command will load the binaries to the kernel. You can
run the latter command if you are sure that the modules will compile
correctly.*

The next in the process is the given command:

```
$ sudo make install
```

This command will install the built kernel to the `\vmlinuz`.

After the kernel has been built, we want to run it the next time we
boot. This is done using the following sets of commands:

```
$ sudo update-initramfs -c -k 4.16.13
$ sudo update-grub
```

The `initramfs` is a cpio archive which is extracted and loaded onto the
RAM and uses it as the initial file system during the boot process.

The `-c` flag specifies that a <em>new initramfs</em> needs to be created, the
kernel version for which is specified using the `-k` flag.

The `update-grub` command updates the `menu.list` file, which contains
the contents of the GRUB menu.
All the files whose names start with `vmlinuz-` are added to the
`menu.lst` and are considered as kernel and are displayed on the next
boot.

The last step is to `reboot` the system and start using the new kernel.

Cheers!!

Resources
1. [vmlinuz](http://www.linfo.org/vmlinuz.html)
2. [`make modules` vs `make
	 modules_install`](https://superuser.com/a/770761)
3. [initramfs](https://www.systutorials.com/docs/linux/man/8-update-initramfs/)
4. [GRUB
	 file](https://docs.oracle.com/cd/E19253-01/817-5504/gavhe/index.html)
5. [Grub updation](https://man.cx/update-grub(8))
6. [du command](https://linux.die.net/man/1/du)
7. [df command](https://linux.die.net/man/1/df)

Credits
1. Fraida Fund, NYU

