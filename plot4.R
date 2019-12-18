# Read the text file
dataFile="~/R/R projects/Learn R/Coursera Exploratory Data Analysis/household_power_consumption.txt"
rawData <- read.table(dataFile, header=TRUE, sep=";", na = "?", stringsAsFactors=FALSE, dec=".")

head(rawData) #inspect the data format

# Subseting the dataset for 2-days in Feb 2007
newData<-subset(rawData, Date %in% c("1/2/2007", "2/2/2007"))


# strip the data/time to create a new var DateTime
newData$DateTime <- strptime(paste(newData$Date, newData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(newData$DateTime,as.numeric(newData$Global_active_power), type="l", 
     xlab= "", ylab="Global Active Power (kilowatts)")

plot(newData$DateTime, as.numeric(newData$Voltage), type="l", ylab="Voltage", xlab="datetime")

plot(newData$DateTime, as.numeric(newData$Sub_metering_1), type="l", ylab="Engergy sub metering", xlab="")
lines(newData$DateTime, as.numeric(newData$Sub_metering_2), type="l", col="red")
lines(newData$DateTime, as.numeric(newData$Sub_metering_3), type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),  
       lty=1, lwd=1,col=c("black", "red", "blue"), bty="n") 

plot(newData$DateTime, as.numeric(newData$Global_reactive_power), type="l", 
     ylab="Global_reactive_power", xlab="datetime")

dev.off()