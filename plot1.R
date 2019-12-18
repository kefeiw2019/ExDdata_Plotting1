# Read the text file
dataFile="~/R/R projects/Learn R/Coursera Exploratory Data Analysis/household_power_consumption.txt"
rawData <- read.table(dataFile, header=TRUE, sep=";", na = "?", stringsAsFactors=FALSE, dec=".")

head(rawData) #inspect the data format

# Subseting the dataset for 2-days in Feb 2007
newData<-subset(rawData, Date %in% c("1/2/2007", "2/2/2007"))


# Build the histogram plot and png file as rquired
png("plot1.png", width=480, height=480)
hist(newData$Global_active_power, col="red",
     main="Global Active Power", 
     xlab = "Global active power (kilowatts)",
     breaks=12,
     xlim = c(0,8), xaxt='n')
axis(side=1, at=c(0,2,4,6)) # set the x-axis label breaks as shown in instructor's example plot
dev.off()
