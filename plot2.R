## Analysis occuring in same directory as data file.

# Loading in the file.
feb1_2data <- read.csv('household_power_consumption.txt', header = TRUE, sep = ';', na.strings = '?')
feb1 <- subset(feb1_2data, feb1_2data$Date == "1/2/2007")
feb2 <- subset(feb1_2data, feb1_2data$Date == "2/2/2007")
feb <- rbind(feb1, feb2)

# Subsetting the data into variables.
dateinfofeb <- as.Date(feb$Date, format = '%d/%m/%Y')
timeinfofeb <- paste(as.Date(dateinfofeb), feb$Time)
datetimeinfofeb <- as.POSIXct(timeinfofeb)

# Generating the plot.
png('plot2.png',width = 480,height = 480)
plot(datetimeinfofeb,feb$Global_active_power,type='l',xlab='',ylab='Global Active Power (kilowatts)')
dev.off()
