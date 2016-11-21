# Load data and format Date
data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")
data$Temp <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
data <- subset(data, Temp >= strptime("2007-02-01 00:00:00", format = "%Y-%m-%d %H:%M:%S")
               & Temp < strptime("2007-02-03 00:00:00", format = "%Y-%m-%d %H:%M:%S"))

# Plot3
with(data, plot(Global_active_power ~ as.POSIXct(Temp),
                ylab = "Energy sub metering",
                xlab = "",
                type = "n", ylim = c(0, 40)))

points(data$Temp, data$Sub_metering_1, type = "l", col = "black")
points(data$Temp, data$Sub_metering_2, type = "l", col = "red")
points(data$Temp, data$Sub_metering_3, type = "l", col = "blue")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = c(1, 1, 1))


dev.copy(png,filename="plot3.png")
dev.off()
