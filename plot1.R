### Plot1.R Global Active Power Historgram 

# Read household power consumption dataset into dataframe
hcons <- read.csv("household_power_consumption.txt", sep = ";", na.strings="?")
table(is.na(hcons)) # check NA values entire table
colSums(is.na(hcons)) # check NA values at column level
hcons <- na.omit(hcons)
colSums(is.na(hcons)) # confirm NA removal

# filter only data for dates 1/2/2007 and 2/2/2007
dgraph <- hcons %>%
    filter(Date == "1/2/2007" |  Date == "2/2/2007")

# To shutdown any graphics devices
graphics.off()

# Plot 1 historgram
hist(dgraph$Global_active_power, xlab = "Global active power(Killowatts)" , main = "Global Active Power" , col = "RED")
# copy histogram into png file
dev.copy(png, file = "Plot1.png")

#close plot device
dev.off()


