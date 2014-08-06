localFile <- "household_power_consumption.txt"

# read in the file for this assignment
data <- read.table(localFile, header = TRUE, sep = ";", na.strings = c("?"))

# transform the Date column to be a Date
data <- transform(data, Date = as.Date(Date, "%d/%m/%Y"))

# subset based on the required datds
data <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# add the DateTime field for this plot
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

par(mfrow = c(1, 1))
with(data, {
    plot(Global_reactive_power ~ DateTime, type = "l", xlab = "datetime")    
})

# create the plot
png(file = "plot4.png")
par(mfrow = c(2, 2))
with(data, {
    plot(Global_active_power ~ DateTime, ylab = "Global Active Power", xlab = "", type = "l")
    plot(Voltage ~ DateTime, type = "l", xlab = "datetime", ylab = "Voltage")
    plot(Sub_metering_1 ~ DateTime, type = "l", col = "black", xlab = "", ylab = "Engergy sub metering")
    points(Sub_metering_2 ~ DateTime, type = "l", col = "red")
    points(Sub_metering_3 ~ DateTime, type = "l", col = "blue")
    legend("topright", bty = "n", lty = c(1, 1, 1), col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))    
    plot(Global_reactive_power ~ DateTime, type = "l", xlab = "datetime")   
})
dev.off()