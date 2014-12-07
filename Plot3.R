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
##
## Plot #3
par(mfrow=c(1,1))
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
        c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)
##
## Make the png file with the required size
## default is width = 480, height = 480
dev.copy(png, "plot3.png")
dev.off()
##
## EOL