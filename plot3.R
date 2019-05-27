### Sub metering graph

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

# plot graph
with(dgraph, {plot(dgraph$Datetime, dgraph$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab =" ")
    lines(dgraph$Datetime, dgraph$Sub_metering_2, col = "red")
    lines(dgraph$Datetime, dgraph$Sub_metering_3, col = "blue")})
legend('topright', lty = 1, lwd = 2, legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"), col = c("black", "red", "blue"))

# copy graph into png file
dev.copy(png, file = "plot3.png")

#close plot device
dev.off()













