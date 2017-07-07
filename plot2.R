# Exploratory Data Analysis - Course Project 1
# Creation of plot 2

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


# Line graphic of Global_active_power vs Time saved as plot2.png
png(file="plot2.png",width = 480, height = 480)
plot(subdf$datetime, subdf$Global_active_power,
  type="l", xlab="", ylab = "Global active power (kilowatts)")
dev.off()
