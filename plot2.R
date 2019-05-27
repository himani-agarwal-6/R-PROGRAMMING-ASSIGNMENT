### Line Plot Global Active power

# Read household power consumption dataset into dataframe
hcons <- read.csv("household_power_consumption.txt", sep = ";", na.strings="?")
table(is.na(hcons)) # check NA values entire table
colSums(is.na(hcons)) # check NA values at column level
hcons <- na.omit(hcons)
colSums(is.na(hcons)) # confirm NA removal

# filter only data for dates 1/2/2007 and 2/2/2007
dgraph <- hcons %>%
    filter(Date == "1/2/2007" |  Date == "2/2/2007")

## convert date
dgraph$Date <- as.Date(dgraph$Date, format = "%d/%m/%Y")

## Converting dates-time
datetime <- paste(as.Date(dgraph$Date), dgraph$Time)
dgraph$Datetime <- as.POSIXct(datetime)

# To shutdown any graphics devices
graphics.off()
# Plot graph
plot(dgraph$Global_active_power ~ dgraph$Datetime, type="l", xlab = "", ylab = "Global active power(Killowatts)")

# copy graph into png file
dev.copy(png, file = "plot2.png")

#close plot device
dev.off()

