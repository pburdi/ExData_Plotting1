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
## Plot #1
par(mfrow=c(1,1))
hist(h$Global_active_power,
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", 
     ylab="Frequency", 
     col="red")
##
## Make the png file with the required size
## default is width = 480, height = 480
dev.copy(png, "plot1.png")
dev.off()
##
## EOL