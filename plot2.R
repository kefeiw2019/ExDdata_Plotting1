# Read the text file
dataFile="~/R/R projects/Learn R/Coursera Exploratory Data Analysis/household_power_consumption.txt"
rawData <- read.table(dataFile, header=TRUE, sep=";", na = "?", stringsAsFactors=FALSE, dec=".")

head(rawData) #inspect the data format

# Subseting the dataset for 2-days in Feb 2007
newData<-subset(rawData, Date %in% c("1/2/2007", "2/2/2007"))


# strip the data/time to create a new var DateTime
newData$DateTime <- strptime(paste(newData$Date, newData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# generate the plot and png file
png("plot2.png", width=480, height=480)
plot(newData$DateTime,as.numeric(newData$Global_active_power), type="l", 
     xlab= "", ylab="Global Active Power (kilowatts)")
dev.off()