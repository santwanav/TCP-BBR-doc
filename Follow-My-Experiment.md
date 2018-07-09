# Recreate the experiment

The following file acts as an index to all the files one might need to
recreate my experiment.

* Make sure that you are running no less than `Ubuntu16.04`. One of the
		utilities `netem` does not work properly with `Ubuntu14.04`, the
		reason for which is still unclear to me. (Please send a PR if you
		find the reason).
* If you are on `Ubuntu16.04`, please use the following command to
		upgrade:
		```
		do-release-upgrade
		```
* Once you make sure you are on a correct version of Ubuntu, you will
		need to build your own kernel. Follow [this](https://github.com/santwanav/TCP-BBR-project-documentation/blob/master/Kernel-Build-Guide.md#setting-up-and-configuring-the-latest-linux-kernel) link to build your
		kernel.
* The next step is to install utilities. The most important of all are
		`netem`, `ss` and `iperf`.

