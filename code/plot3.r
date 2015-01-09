#load data
setwd("C:/Data_wd/GitHub/ExData_Plotting1")
filename = "./data/household_power_consumption.txt"
powerdata = read.table(filename,header=TRUE,sep=";",colClasses = c("character","character","numeric", "numeric", "numeric", "numeric","numeric","numeric","numeric"),na.strings = "?")
subsetdata <- powerdata[powerdata$Date == "1/2/2007" | powerdata$Date == "2/2/2007",]
datetime <- paste(subsetdata$Date, subsetdata$Time)
subsetdata$DateTime = strptime(datetime,"%d/%m/%Y %H:%M:%S")

#plot3
png(filename="./myfigure/plot3.png",width=480,height=480,units="px",bg="white")
with(subsetdata, {
  plot(DateTime,Sub_metering_1,type="l",xlab="", ylab="Energy Sub Metering", col="black")
  lines(DateTime, Sub_metering_2, col="red")
  lines(DateTime, Sub_metering_3, col="blue")
})
legend("topright",col=c("black", "red", "blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1)
dev.off()