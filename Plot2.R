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


#plot 2nd graph
png(filename = "plot2.png",
    width = 480, height = 480, units = "px", pointsize = 12,
     bg = "white",  res = NA)
plot(as.numeric(paste(td$Global_active_power)), col="black", ylab="Global Active Power (Kilowatts)", pch='', xaxt="n", xlab="", type="o")
axis(1, at=c(0, nrow(td)/2, nrow(td)), labels=c("Th", "Fri", "Sat"))
dev.off()
