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
		`netem`, `ss` and `iperf`. Procedure to install all of them can be
		found
		[here](https://github.com/santwanav/TCP-BBR-project-documentation/blob/master/UtilitiesUsed.md).
		The link also contains other utilities you might find useful for the
		project or just interesting to your own taste.
* Once you are setup, you need to begin with the experiment. The first
		step for this is [Instrument
		BBR](https://github.com/santwanav/TCP-BBR-project-documentation/blob/master/InstrumentingBBR.md#instrumenting-bbr)
* Now the next step is to apply the network impairment. The commands and
		other useful information for the same can be found
		[here](https://github.com/santwanav/TCP-BBR-project-documentation/blob/master/NetworkImpairment.md#add-delay-rate-limit-or-both)
* If you wish to troubleshoot, refer to [this](https://github.com/santwanav/TCP-BBR-project-documentation/blob/master/Troubleshooting.md#trouble-shooting) link. If the issue
		still persists, contact me.


## Contact-me

* E-mail me: vermasantwana@gmail.com
* Find me on [facebook](https://www.facebook.com/santwana.verma.16)
* Visit my homepage

