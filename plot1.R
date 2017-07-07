# Exploratory Data Analysis - Course Project 1
# Creation of plot 1

# Read the data from file
FileName <- "household_power_consumption.txt"
df <- read.table(FileName, header = TRUE, sep = ";", na.strings = "?")

# convert the date variable to Date class: from "%d/%m/%Y" to "%Y-%m-%d"
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")

# Subset the data
subdf <- subset(df, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
#subdf <- df[df$Date %in% c("1/2/2007","2/2/2007") ,] # with no need to change Date Class

#Histogram of Global_active_power saved as plot1.png
png(file="plot1.png",width = 480, height = 480)
hist(subdf$Global_active_power, col="red",
  xlab = "Global active power (kilowatts)",
  main = "Global active power")
dev.off()
