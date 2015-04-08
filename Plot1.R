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

#plot first graph
png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12,
     bg = "white",  res = NA)
hist(as.numeric(paste(td$Global_active_power)), col="red", main="Global Active Power (GAP)", xlab="GAP (kilowatts)", ylab="Frequency")
dev.off()

