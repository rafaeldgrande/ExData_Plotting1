
power <- read.table("household_power_consumption.txt",
                    header = TRUE, sep = ";", na.strings = "?",
                    colClasses = c("character", "character", rep("numeric", 7)))
power <- subset(power, Date %in% c("1/2/2007", "2/2/2007"))
power$DateTime <- strptime(paste(power$Date, power$Time), format = "%d/%m/%Y %H:%M:%S")

# Plot 3
png("plot3.png", width = 480, height = 480)
plot(power$DateTime, power$Sub_metering_1, type = "l",
     xlab = "", ylab = "Energy sub metering")
lines(power$DateTime, power$Sub_metering_2, col = "red")
lines(power$DateTime, power$Sub_metering_3, col = "blue")
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1)
dev.off()
