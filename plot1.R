## Script performed in current working directory containing 'household_power_consumption.txt' file.

# Loading in the file.
feb1_2data <- read.csv('household_power_consumption.txt', header = TRUE, sep = ';', na.strings = '?')
feb1 <- subset(feb1_2data, feb1_2data$Date == "1/2/2007")
feb2 <- subset(feb1_2data, feb1_2data$Date == "2/2/2007")
feb <- rbind(feb1, feb2)

# Creating the histogram.
png('plot1.png',width = 480,height = 480)
hist(feb$Global_active_power, col = 'red',xlab = 'Global Active Power (kilowatts)',main = "Global Active Power")
dev.off()
