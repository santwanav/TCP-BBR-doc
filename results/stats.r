library(ggplot2)

dir <- "~/Desktop/IITK/Summer\'18-NYO/Actual\ Work/TCP-BBR-project-documentation/results/delay10ms/"
dat <- read.csv(paste(dir, "stats.csv", sep=""))


q <- ggplot(dat)
q <- q + geom_line(aes(x=ts, y=bbr_min_rtt), colour="blue")
q <- q + geom_ribbon(aes(x=ts, ymin=rtt-rttvar, ymax=rtt+rttvar), fill="blue", alpha=0.25)
q <- q + scale_x_continuous("Time (s)")
q <- q + scale_y_continuous("RTT and min RTT (ms)")

png(paste(dir, "rtt2.png", sep=""))
print(q)
dev.off()



r <- ggplot(dat)
r <- r + geom_line(aes(x=ts, y=cwnd), color="blue")
r <- r + scale_x_continuous("Time (s)" , limits=c(min(dat$ts), min(dat$ts)+20))
r <- r + scale_y_continuous("CWND (in MSS)")
png(paste(dir, "cwnd.png", sep=""))
print(r)
dev.off()



s <- ggplot(dat)
s <- s + geom_line(aes(x=ts, y=delivery_rate, color="mediumorchid"))
s <- s + scale_x_continuous("Time (s)")
s <- s + scale_y_continuous("Delivery rate (bps)")
png(paste(dir, "delivery.png", sep=""))
print(s)
dev.off()


t <- ggplot(dat)
t <- t + geom_point(aes(x=ts, y=bbr_cwnd_gain, colour="blue"))
t <- t + geom_point(aes(x=ts, y=bbr_pacing_gain, colour="purple"))
t <- t + scale_color_discrete(name = "Gains", labels = c("cwnd_gain", "pacing_gain"))
t <- t + scale_x_continuous("Time (s)")
t <- t + scale_y_continuous("Gains", limits=c(0,3.5))
png(paste(dir, "gains.png", sep=""))
print(t)
dev.off()

p <- ggplot(dat)
p <- p + geom_point(aes(x=ts, y=bbr_cwnd_gain, colour="blue"))
p <- p + geom_point(aes(x=ts, y=bbr_pacing_gain, colour="purple"))
p <- p + scale_color_discrete(name = "Gains", labels = c("cwnd_gain", "pacing_gain"))
p <- p + scale_x_continuous("Time (s)", limits=c(min(dat$ts), min(dat$ts)+5))
p <- p + scale_y_continuous("Gains", limits=c(0,3.5))
png(paste(dir, "gains_beginning.png", sep=""))
print(p)
dev.off()


v <- ggplot(dat)
v <- v + geom_line(aes(x=ts, y=bbr_bw, colour="purple"))
v <- v + scale_x_continuous("Time (s)") #, limits=c(min(dat$ts), min(dat$ts)+20))
v <- v + scale_y_continuous("Bandwidth (bps)")
png(paste(dir, "bandwidth.png", sep=""))
print(v)
dev.off()

u <- ggplot(dat)
u <- u + geom_line(aes(x=ts, y=send, colour="blue"))
u <- u + scale_x_continuous("Time (s)") #, limits=c(min(dat$ts), min(dat$ts)+20))
u <- u + scale_y_continuous("send")
png(paste(dir, "send.png", sep=""))
print(u)
dev.off()

w <- ggplot(dat)
dat$pacingRate <- dat$bbr_pacing_gain * dat$bbr_bw
w <- w + geom_line(aes(x=ts, y=pacing_rate), colour="blue")
w <- w + geom_line(aes(x=ts, y=bbr_pacing_gain * bbr_bw), colour="purple")
w <- w + scale_x_continuous("Time (s)", limits=c(min(dat$ts), min(dat$ts)+20))
w <- w + scale_y_continuous("Pacing Rate")
png(paste(dir, "pacingRateCheck.png", sep=""))
print(w)
dev.off()
