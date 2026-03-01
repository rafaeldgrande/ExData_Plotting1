
power <- read.table("household_power_consumption.txt",
                    header = TRUE, sep = ";", na.strings = "?",
                    colClasses = c("character", "character", rep("numeric", 7)))
power <- subset(power, Date %in% c("1/2/2007", "2/2/2007"))
power$DateTime <- strptime(paste(power$Date, power$Time), format = "%d/%m/%Y %H:%M:%S")

# Plot 4
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

# Top left
plot(power$DateTime, power$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power")

# Top right
plot(power$DateTime, power$Voltage, type = "l",
     xlab = "datetime", ylab = "Voltage")

# Bottom left
plot(power$DateTime, power$Sub_metering_1, type = "l",
     xlab = "", ylab = "Energy sub metering")
lines(power$DateTime, power$Sub_metering_2, col = "red")
lines(power$DateTime, power$Sub_metering_3, col = "blue")
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1, bty = "n")

# Bottom right
plot(power$DateTime, power$Global_reactive_power, type = "l",
     xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
