localFile <- "household_power_consumption.txt"

# read in the file for this assignment
data <- read.table(localFile, header = TRUE, sep = ";", na.strings = c("?"))

# transform the Date column to be a Date
data <- transform(data, Date = as.Date(Date, "%d/%m/%Y"))

# subset based on the required datds
data <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# create the plot
png(file = "plot1.png")
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()



