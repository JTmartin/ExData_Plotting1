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


#plot 3
png(filename= "./plot3.png",width=480,height=480,units="px",)
plot(trimData$Date,trimData$Sub_metering_1,type="l",col="black",xlab="",ylab="Energy sub metering")
lines(trimData$Date,trimData$Sub_metering_2,col="red")
lines(trimData$Date,trimData$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), lty="solid", 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), inset =0)
dev.off()


