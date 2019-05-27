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
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(dgraph,{plot(Datetime,Global_active_power,ylab = "Global Active Power", xlab = " ", type = "l")
    plot(Datetime,Voltage,ylab = "Voltage", xlab = "datetime ", type = "l")})

with(dgraph, {plot(Datetime,Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab =" ")
    lines(Datetime,Sub_metering_2, col = "red")
    lines(Datetime,Sub_metering_3, col = "blue")})
legend('topright', lty = 1, lwd = 2, legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"), col = c("black", "red", "blue"), bty="n")

with(dgraph, {plot(dgraph$Datetime,dgraph$Global_reactive_power,ylab = "Global_reactive_power", xlab = "datetime", type = "l")
})

# copy graph into png file
dev.copy(png, file = "plot4.png")

#close plot device
dev.off()













