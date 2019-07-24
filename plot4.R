## Analysis performed in current working directory with 'household_power_consumption.txt'.

# Loading in the file.
feb1_2data <- read.csv('household_power_consumption.txt', header = TRUE, sep = ';', na.strings = '?')
feb1 <- subset(feb1_2data, feb1_2data$Date == "1/2/2007")
feb2 <- subset(feb1_2data, feb1_2data$Date == "2/2/2007")
feb <- rbind(feb1, feb2)

# Subsetting variables.
dateinfofeb <- as.Date(feb$Date, format = '%d/%m/%Y')
timeinfofeb <- paste(as.Date(dateinfofeb), feb$Time)
datetimeinfofeb <- as.POSIXct(timeinfofeb)

submeter1 <- as.numeric(feb$Sub_metering_1)
submeter2 <- as.numeric(feb$Sub_metering_2)
submeter3 <- as.numeric(feb$Sub_metering_3)

# Generating the plot.
png('plot4.png',width = 480,height = 480)
par(mfrow=c(2,2),mar=c(4,4,2,1), oma=c(0,0,2,0))

plot(datetimeinfofeb,feb$Global_active_power,type='l',xlab='',ylab='Global Active Power')

plot(datetimeinfofeb,feb$Voltage,type='l',ylab='Voltage',xlab='datetime')

plot(datetimeinfofeb, submeter1, type='l', ylab='Energy sub metering',xlab='')
lines(submeter2~datetimeinfofeb,type='l',col='red')
lines(submeter3~datetimeinfofeb,type='l',col='blue')
legend('topright',col=c('black','red','blue'),legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),lty=1,lwd=2)

plot(datetimeinfofeb,feb$Global_reactive_power,xlab='datetime',ylab='Global_reactive_power',type='l')

dev.off()

