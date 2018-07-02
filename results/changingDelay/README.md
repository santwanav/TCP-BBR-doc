# README

This folder contains the data plotted for changing delays on the
network. The cycle for changing the delay is as follows
`[5,10,15,20,25,30,25,20,15,10,5]`. Since the delay is applied to both
the interfaces of the impairment box the cycle becomes as follows
`[10,20,30,40,50,60,50,40,30,20,10` all in ms, each changing after
10secs. The script for doing so is [here](https://github.com/santwanav/TCP-BBR-project-documentation/blob/master/results/changingDelay/change-delay.sh).

The script for ss-monitor is [here]().
Command for ss-montior:
```
./ss-montior.sh stats.csv
```

The script for queuemonitor is [here]().
Command for queuemonitor:
```
./queuemonitor.sh eth3 125 0.01 >> text.txt
```

The script for getting a csv file from the text file is [here]().
The command for the same is:
```
./queue-monitor.sh text.txt stats.csv
```

The bbr data is in a file name `stats.csv` and the one for queue is in
`impairstats.csv`.

