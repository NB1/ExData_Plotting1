#common stuff to all four PNGs
install.packages("lubridate")
library("lubridate")
library("dplyr")
rm(list=ls())
data <- read.csv("household_power_consumption.txt", header=TRUE, sep=';')
data <- tbl_df(data)
td <- subset(data, dmy(data$Date) > dmy("31/01/2007") & dmy(data$Date) < dmy("03/02/2007"))#td = two days
rm(data)
for (i in 1:nrow(td)) {for (j in 1:ncol(td)) {if (td[i,j] == "?") {td[i,j] = "na"}}}

#plot 3rd graph
png(filename = "plot3.png")
mx <- max(as.numeric(paste(td$Sub_metering_3)), as.numeric(paste(td$Sub_metering_1)), as.numeric(paste(td$Sub_metering_2)))
mn <- min(as.numeric(paste(td$Sub_metering_3)), as.numeric(paste(td$Sub_metering_1)), as.numeric(paste(td$Sub_metering_2)))
y <- rep(mx, nrow(td))
y[1] <- mn
plot(y, col="black", ylab="Energy Sub Metering", pch='', xaxt="n", xlab="", type='n')
points(as.numeric(paste(td$Sub_metering_1)), col="black", pch = '', type='o')
points(as.numeric(paste(td$Sub_metering_2)), col="red", pch = '', type='o')
points(as.numeric(paste(td$Sub_metering_3)), col="blue", pch = '', type='o')
axis(1, at=c(0, nrow(td)/2, nrow(td)), labels=c("Th", "Fri", "Sat"))
legend('topright', names(td)[7:9],
   lty=1, col=c('black', 'red', 'blue'), cex=1)
dev.off()
