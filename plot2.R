localFile <- "household_power_consumption.txt"

# read in the file for this assignment
data <- read.table(localFile, header = TRUE, sep = ";", na.strings = c("?"))

# transform the Date column to be a Date
data <- transform(data, Date = as.Date(Date, "%d/%m/%Y"))

# subset based on the required datds
data <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# add the DateTime field for this plot
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

# create the plot
png(file = "plot2.png")
plot(data$Global_active_power ~ data$DateTime, ylab = "Global Active Power (kilowatts)", xlab = "", type = "l")
dev.off()
