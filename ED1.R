# Reading the dataset and processing the data

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "ED1.zip", mode="wb")
# unzip data and read 
unzip("ED1.zip")
ED1 <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
head(ED1)

## Filter for specific dates
subsetED1 <- ED1[ED1$Date %in% c("1/2/2007","2/2/2007"),]

## Set column type 
subED1Comp <- subsetED1[complete.cases(subsetED1),]
globalActivePower <- as.numeric(subED1Comp$Global_active_power)
globalReactivePower <- as.numeric(subED1Comp$Global_reactive_power)
voltage <- as.numeric(subED1Comp$Voltage)
subMetering1 <- as.numeric(subED1Comp$Sub_metering_1)
subMetering2 <- as.numeric(subED1Comp$Sub_metering_2)
subMetering3 <- as.numeric(subED1Comp$Sub_metering_3)

## Plot 1
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

## Print Plot 1
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()


## Set Date format
datetime <- strptime(paste(subED1Comp$Date, subED1Comp$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## Plot 2
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

## Print Plot 2
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

## Plo t 3
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

## Print Plot 3
png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()

## Plot 4, in a 2x2 panel
par(mfrow = c(2, 2)) 
# First plot
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
# Second plot
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
# Third plot
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

## Print Plot 4
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
# First plot
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
# Second plot
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
# Third plot
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
# Fourth plot
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power", cex=0.2)
dev.off()

