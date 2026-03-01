
# Read and subset data
power <- read.table("household_power_consumption.txt",
                    header = TRUE, sep = ";", na.strings = "?",
                    colClasses = c("character", "character", rep("numeric", 7)))
power <- subset(power, Date %in% c("1/2/2007", "2/2/2007"))
power$DateTime <- strptime(paste(power$Date, power$Time), format = "%d/%m/%Y %H:%M:%S")

# Plot 1
png("plot1.png", width = 480, height = 480)
hist(power$Global_active_power, col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")
dev.off()
