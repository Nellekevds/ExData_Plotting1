## written by: Nellleke van der steen
## 08-02-2017
## Coursera

## Read only two dates to inscrease speed
data <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'), sep =  ";", stringsAsFactors = F)

## Convert as date and include time in one column
data$V1 <- as.Date(data$V1, format = "%d/%m/%Y")
data$time <- paste(data$V1,data$V2)
data$time <- as.POSIXct(data$time)

## Plot and save as png
png("plot3.png", width=480, height=480, res=90)
plot(data$time,data$V7, ylab = "Energy sub metering", xlab = " ",  type = "l")
lines(data$time,data$V8, ylab = "Energy sub metering", xlab = " ",   col = "red" )
lines(data$time,data$V9, ylab = "Energy sub metering", xlab = " ",   col = "blue" )
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1)
dev.off()