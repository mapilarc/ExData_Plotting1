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

png("plot2.png", width=480, height=480)

plot(powerdf$Time, powerdf$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")

dev.off()