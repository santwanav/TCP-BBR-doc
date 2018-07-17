library(ggplot2)
library(grid)
library(lattice)
library(reshape)

dir <- "~/Desktop/IITK/Summer\'18-NYU/Actual\ Work/TCP-BBR-project-documentation/results/variations/100/var10-7-1/"
dat <- read.csv(paste(dir, "stats.csv", sep=""))

# Uncomment the following line to read queue data as well, stored as impairstats.csv
#datm <- read.csv(paste(dir, "impairstats.csv", sep=""))

# Every plot should essentially contain all the phases. You might have to comment a few for some set of parameters.
dat$phase <- "ProbeBW"
dat[dat$bbr_pacing_gain < 0.7,]$phase <- "Drain"
dat[dat$bbr_pacing_gain > 2.0,]$phase <- "Startup"
dat[dat$bbr_cwnd_gain == 1.0, ]$phase <- "ProbeRTT"
dat$Phase <- factor(dat$phase)
mdat <- melt(dat, id=c("ts", "phase")

# Umcomment the following lines to read and bind both the datas
#mdatm <- melt(datm, id=c("ts"))
#mdatall <- rbind(mdat, mdatm)

mdatall$value <- as.numeric(as.character(mdatall$value))
mdat$value <- as.numeric(as.character(mdat$value))

# Change the list acc to the data you wish to plot
fields = c("bbr_bw", "bbr_min_rtt","rtt")

# Plot the graph of estimated bandwidth and RTT for the complete time the experiment was run.
q <- ggplot(mdat[mdat$variable %in% fields,]) + geom_line(aes(x=ts, y=value), size = 0.1)
q <- q + geom_point(aes(x=ts, y=value, colour=phase), size=0.1)
q <- q + scale_colour_brewer(palette="Set1") + facet_wrap(~ variable, ncol=1, scale="free_y")
q <- q + scale_x_continuous("Time (s)")
q <- q + theme(legend.position="bottom")
png(paste(dir,"Esti-bandwidth-rtt.png", sep=""))
print(q)
dev.off()

# Estimated bandwidth and RTT for the first 60 secs, assuming that the experiment was run for more than 60secs
r <- ggplot(mdat[mdat$variable %in% fields,]) + geom_line(aes(x=ts, y=value), size = 0.1)
r <- r + geom_point(aes(x=ts, y=value, colour=phase), size=0.1)
r <- r + scale_colour_brewer(palette="Set1") + facet_wrap(~ variable, ncol=1, scale="free_y")
r <- r + scale_x_continuous("Time (s)", limits=c(min(mdat$ts), min(mdat$ts)+60))
r <- r + theme(legend.position="bottom")
png(paste(dir,"60secs-Esti-bandwidth-rtt.png", sep=""))
print(r)
dev.off()

# Estimated bandwidth and RTT for the first 30 secs, assuming that the experiment was run for more than 60secs
s <- ggplot(mdat[mdat$variable %in% fields,]) + geom_line(aes(x=ts, y=value), size = 0.1)
s <- s + geom_point(aes(x=ts, y=value, colour=phase), size=0.1)
s <- s + scale_colour_brewer(palette="Set1") + facet_wrap(~ variable, ncol=1, scale="free_y")
s <- s + scale_x_continuous("Time (s)", limits=c(min(mdat$ts), min(mdat$ts)+30))
s <- s + theme(legend.position="bottom")
png(paste(dir,"30secs-Esti-Bandwidth-rtt.png", sep=""))
print(s)
dev.off()

# Estimated bandwidth and RTT for the first 15 secs, assuming that the experiment was run for more than 60secs
t <- ggplot(mdat[mdat$variable %in% fields,]) + geom_line(aes(x=ts, y=value), size = 0.1)
t <- t + geom_point(aes(x=ts, y=value, colour=phase), size=0.1)
t <- t + scale_colour_brewer(palette="Set1") + facet_wrap(~ variable, ncol=1, scale="free_y")
t <- t + scale_x_continuous("Time (s)", limits=c(min(mdat$ts), min(mdat$ts)+15))
t <- t + theme(legend.position="bottom")
png(paste(dir,"15secs-Bandwidth-rtt.png", sep=""))
print(t)
dev.off()

u <- ggplot(dat) + geom_line(aes(x=(segs_out*s-bytes_acked), y=delivery_rate))
png(paste(dir, "characteristic.png",sep=""))
print(u)
dev.off()

