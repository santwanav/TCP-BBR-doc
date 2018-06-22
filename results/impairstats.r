library(ggplot2)

dir <- "~/Desktop/IITK/Summer\'18-NYO/Actual\ Work/TCP-BBR-project-documentation/results/delay20ms/"
datm <- read.csv(paste(dir, "impairstats.csv", sep=""))

a <- ggplot(datm)
a <- a + geom_line(aes(x=ts, y=backlog_in_bytes), colour="blue")
a <- a + scale_x_continuous("Time (s)") #, limits=c(min(dat$ts), min(dat$ts)+20))
a <- a + scale_y_continuous("Backlog In Bytes")
png(paste(dir, "ByteBacklog.png", sep=""))
print(a)
dev.off()