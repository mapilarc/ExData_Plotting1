setwd('/home/marcin/work/coursera/')

powerdf <- read.csv(
  file="household_power_consumption.txt",
  head=TRUE,sep=";",
  colClasses=c("character", "character", rep("numeric",7)), na="?")

#date&time conv
powerdf$Time <- strptime(paste(powerdf$Date, powerdf$Time), "%d/%m/%Y %H:%M:%S")
powerdf$Date <- as.Date(powerdf$Date, "%d/%m/%Y")

#select these 2 days
powerdf <- subset(powerdf, Date %in% as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d"))

png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

# topleft
plot(powerdf$Time, powerdf$Global_active_power, type="l", xlab="", ylab="Global Active Power")

# topright
plot(powerdf$Time, powerdf$Voltage, type="l", xlab="datetime", ylab="Voltage")

# bottomleft
plot(powerdf$Time, powerdf$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(powerdf$Time, powerdf$Sub_metering_2, col="red")
lines(powerdf$Time, powerdf$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, box.lwd=0)

# bottomright
plot(powerdf$Time, powerdf$Global_reactive_power, type="n", xlab="datetime", ylab="Global_reactive_power")
lines(powerdf$Time, powerdf$Global_reactive_power)

dev.off()