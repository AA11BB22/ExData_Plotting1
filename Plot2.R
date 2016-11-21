# Load data and format Date
data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")
data$Temp <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
data <- subset(data, Temp >= strptime("2007-02-01 00:00:00", format = "%Y-%m-%d %H:%M:%S")
               & Temp < strptime("2007-02-03 00:00:00", format = "%Y-%m-%d %H:%M:%S"))

# Plot2
with(data, plot(Global_active_power ~ as.POSIXct(Temp),
                ylab = "Global Active Power (kilowatts)",
                xlab = "",
                type = "l"))


dev.copy(png,filename="plot2.png")
dev.off()
