## written by: Nellleke van der steen
## 08-02-2017
## Coursera

## Read only two dates to inscrease speed
data <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'), sep =  ";", stringsAsFactors = F)

## Convert as date
data$V1 <- as.Date(data$V1, format = "%d/%m/%Y")

## Plot and save as png
png("plot1.png", width=480, height=480, res=100)
hist(data$V3, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()