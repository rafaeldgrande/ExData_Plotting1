power <- read.table("household_power_consumption.txt",
                    header = TRUE, sep = ";", na.strings = "?",
                    colClasses = c("character", "character", rep("numeric", 7)))
power <- subset(power, Date %in% c("1/2/2007", "2/2/2007"))
power$DateTime <- strptime(paste(power$Date, power$Time), 
                           format = "%d/%m/%Y %H:%M:%S", 
                           tz = "America/Los_Angeles")

# Plot 2
png("plot2.png", width = 480, height = 480)
plot(power$DateTime, power$Global_active_power, type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()
