# Exploratory Data Analysis
# Peer-graded Assignment: Course Project 1
#load the data
rm(list = ls())
#Load and Clean the table
data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
# convert the date variable to date class
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
# Filter data set from Feb. 1, 2007 to Feb. 2, 2007
data <- subset(data, subset = (Date >="2007-02-01" & Date <= "2007-02-02"))
#Convert dates and times
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

#  Plot 2
#Convert data and time to specific format
data$datetime <- as.POSIXct(data$datetime)
attach(data)
plot(Global_active_power ~ datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab= "")

# Save file
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
detach(data)