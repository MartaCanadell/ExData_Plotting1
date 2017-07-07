# Exploratory Data Analysis - Course Project 1
# Creation of plot 4

# Read the data from file
FileName <- "household_power_consumption.txt"
df <- read.table(FileName, header = TRUE, sep = ";", na.strings = "?")

# convert the date variable to Date class:
# from "%d/%m/%Y" string to "%Y-%m-%d" date object
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")

# Subset the data
subdf <- subset(df, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Changing the weekday label from Catalan (my local System) to English
Sys.setlocale("LC_TIME", "C")
# Convert day and time into datetime variable for a new continuous variable
subdf$datetime <- strptime(paste(subdf$Date, subdf$Time), "%Y-%m-%d %H:%M:%S")


# 4 combined plots saved as plot4.png
png(file="plot4.png",width = 480, height = 480)
par(mfrow=c(2,2))

plot(subdf$datetime, subdf$Global_active_power,
  type="l", xlab="", ylab = "Global active power")

plot(subdf$datetime, subdf$Voltage,
    type="l", xlab="datetime", ylab = "Voltage")

plot(subdf$datetime, subdf$Sub_metering_1,
  type="l", xlab="", ylab = "Energy Sub Metering", col = "black")
lines(subdf$datetime, subdf$Sub_metering_2,
   col = "red")
lines(subdf$datetime, subdf$Sub_metering_3,
   col = "blue")
legend("topright", lty = 1,
  col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(subdf$datetime, subdf$Global_reactive_power,
    type="l", xlab="datetime", ylab = "Global_reactive_power")

dev.off()
