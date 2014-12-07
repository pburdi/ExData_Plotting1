## download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "hpc.zip" )
## unzipped with winwar
## calculate the memory 
## 2,075,259 rows X 9 columns × 8 bytes/numeric
## 149418648 bytes
## / 1048576 =  142.50 Megabytes
##
## Create data frame with read.table in hpc with using seperator and changing the class
hpc <- read.table("./household_power_consumption.txt", sep=";", colClasses=c("character", "character", rep("numeric",7)), na="?", header=TRUE)
##
## Create h with a subset - only 2 days of data
h <- hpc[(hpc$Date == "1/2/2007" | (hpc$Date == "2/2/2007")),]
##
## Modify Time to Date/Time
h$Time <- strptime(paste(h$Date, h$Time), "%d/%m/%Y %H:%M:%S")
## Plot #4 
##
## Set the number of plots (4)
par(mfrow=c(2,2))
##
## 4-1
plot(h$Time, 
     h$Global_active_power,
     xlab="",
     type="l",
     ylab="Global Active Power")
##
# 4-2
plot(h$Time, 
     h$Voltage, 
     type="l",
     xlab="datetime", 
     ylab="Voltage")
##
## 4-3
plot(h$Time, 
     h$Sub_metering_1, 
     type="l", 
     col="black",
     xlab="", 
     ylab="Energy sub metering")
##
## Trend Lines
  lines(h$Time, h$Sub_metering_2, col="red")
  lines(h$Time, h$Sub_metering_3, col="blue")
##
## Create a legend for the this graph
  legend("topright",
       col=c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1,
       box.lwd=0)
##
## 4-4
plot(h$Time, 
     h$Global_reactive_power, 
     type="n",
     xlab="datetime", 
     ylab="Global_reactive_power")
##
## Trend Line
lines(h$Time, h$Global_reactive_power)
##
## Make the png file with the required size
## default is width = 480, height = 480
dev.copy(png, "plot4.png")
dev.off()
##
## EOL