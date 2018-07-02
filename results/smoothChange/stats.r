library(ggplot2)
library(reshape)

dir <- "~/Desktop/IITK/Summer\'18-NYO/Actual\ Work/TCP-BBR-project-documentation/results/attempt/"
dat <- read.csv(paste(dir, "stats.csv", sep=""))
datm <- read.csv(paste(dir, "impairstats.csv", sep=""))

mdat <- melt(dat, id=c("ts"))
mdatm <- melt(datm, id=c("ts"))

mdatall <- rbind(mdat, mdatm)

# The main variable is ts (i.e time). The values you want to plot for all the values of the time should be given in the 'fields' field.

fields = c("bbr_min_rtt", "in_queue.number","bbr_cwnd_gain")
q <- ggplot(mdatall[mdatall$variable %in% fields,]) + geom_point(aes(x=ts, y=value)) + geom_line(aes(x=ts, y=value))
q <- q + facet_wrap(~ variable, ncol=1, scale="free_y")

png(paste(dir,"plot.png", sep=""))
print(q)
dev.off()

