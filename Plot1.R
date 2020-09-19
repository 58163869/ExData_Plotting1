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

## Print Plot 1
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
