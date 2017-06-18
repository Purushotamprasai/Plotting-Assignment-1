# Coursera : Exploratory Data Analysis
# Peer-graded Assignment: Course Project 1
# download and unzip data
setwd("/Users/puru/Desktop/Exploratory Data Analysis/Week1/Course Project1")
if(!file.exists('data')) dir.create('data')
fileUrl <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
download.file(fileUrl, destfile = './data/household_power_consumption.zip',method="curl")
unzip('./data/household_power_consumption.zip', exdir = './data')
# Read data into R
rm(list = ls())
data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
# Format date to type Date
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
# Filter data set from Feb. 1, 2007 to Feb. 2, 2007
data <- subset(data, subset = (Date >="2007-02-01" & Date <= "2007-02-02"))
# Convert dates and times
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
data$datetime <- as.POSIXct(data$datetime)

# Plot4
par(mfrow = c(2, 2))
attach(data)
plot(Global_active_power ~ datetime, type = "l", ylab = "Global Active Power", xlab = "")
plot(Voltage ~ datetime, type = "l")
plot(Sub_metering_1 ~ datetime, type = "l", ylab = "Energy sub metering",xlab = "")
lines(Sub_metering_2 ~ datetime, col = "Red")
lines(Sub_metering_3 ~ datetime, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"),legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),bty = "n")
plot(Global_reactive_power ~ datetime, type = "l")
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()
detach(data)