library(ggplot2)
library(reshape)

dir <- "~/Desktop/IITK/Summer\'18-NYO/Actual\ Work/TCP-BBR-project-documentation/results/variations/100/var1-30/"
dat <- read.csv(paste(dir, "stats.csv", sep=""))
#datm <- read.csv(paste(dir, "impairstats.csv", sep=""))

dat$phase <- "ProbeBW"
#dat[dat$bbr_pacing_gain < 0.7,]$phase <- "Drain"
dat[dat$bbr_pacing_gain > 2.0,]$phase <- "Startup"
#dat[dat$bbr_cwnd_gain == 1.0, ]$phase <- "ProbeRTT"
dat$Phase <- factor(dat$phase)
mdat <- melt(dat, id=c("ts", "phase"))
#mdatm <- melt(datm, id=c("ts"))

#mdatall <- rbind(mdat, mdatm)
#mdatall$value <- as.numeric(as.character(mdatall$value))
mdat$value <- as.numeric(as.character(mdat$value))

# The main variable is ts (i.e time). The values you want to plot for all the values of the time should be given in the 'fields' field.

fields = c("bbr_bw") #bbr_min_rtt", "bbr_cwnd_gain", "bbr_pacing_gain", "bbr_bw")
q <- ggplot(mdat[mdat$variable %in% fields,]) + geom_line(aes(x=ts, y=value), size = 0.1)
q <- q + geom_point(aes(x=ts, y=value, colour=phase), size=0.1)
q <- q + scale_colour_brewer(palette="Set1") + facet_wrap(~ variable, ncol=1, scale="free_y")
q <- q + scale_x_continuous("Time (s)") #limits=c( min(mdat$ts), min(mdat$ts)+30))
q <- q + scale_y_continuous("Bandwidth (bps)", limits=c( 0, 2.5e+06))
q <- q + theme(legend.position="bottom")
png(paste(dir,"plot.png", sep=""))
print(q)
dev.off()

r <- ggplot(dat) + geom_line(aes(x=(segs_out*s-bytes_acked), y=delivery_rate))
png(paste(dir, "characteristic.png",sep=""))
print(r)
dev.off()

