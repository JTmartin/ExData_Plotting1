setwd("./datascience/ExploreData/")
fileName<-"./datascience/ExploreData/household_power_consumption.txt"

Sys.setlocale("LC_TIME", "en_US")

someData<-read.table(fileName, quote="",sep=";", header=TRUE)

someData$Date<-as.Date(someData$Date,"%d / %m / %Y")

trimData<-someData[someData$Date=="2007-02-01" | someData$Date=="2007-02-02",]
trimData$Global_active_power<-as.numeric(as.character(trimData$Global_active_power))
trimData$Date<-strptime(paste(trimData$Date,trimData$Time),"%Y-%m-%d %H:%M:%S")

trimData$Sub_metering_1<-as.numeric(as.character(trimData$Sub_metering_1))
trimData$Sub_metering_2<-as.numeric(as.character(trimData$Sub_metering_2))
trimData$Sub_metering_3<-as.numeric(as.character(trimData$Sub_metering_3))


#plot 2
png(filename= "./plot2.png",width=480,height=480,units="px",)
plot(trimData$Date,trimData$Global_active_power, type="l",main="",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
