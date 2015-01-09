#load data
setwd("C:/Data_wd/GitHub/ExData_Plotting1")
filename = "./data/household_power_consumption.txt"
powerdata = read.table(filename,header=TRUE,sep=";",colClasses = c("character","character","numeric", "numeric", "numeric", "numeric","numeric","numeric","numeric"),na.strings = "?")
subsetdata <- powerdata[powerdata$Date == "1/2/2007" | powerdata$Date == "2/2/2007",]
datetime <- paste(subsetdata$Date, subsetdata$Time)
subsetdata$DateTime = strptime(datetime,"%d/%m/%Y %H:%M:%S")

#plot4
png(filename="./myfigure/plot4.png",width=480,height=480,units="px",bg="white")
par(mfrow=c(2,2)) 

with(subsetdata, {
  #top left plot
  plot(DateTime,Global_active_power,type="l",xlab="", ylab="Global Active Power")
  #top right plot 
  plot(DateTime,Voltage,type="l",xlab="datetime", ylab="Voltage")
  #bottom left plot 
  plot(DateTime,Sub_metering_1,type="l",xlab="", ylab="Energy Sub Metering", col="black")
  lines(DateTime, Sub_metering_2, col="red")
  lines(DateTime, Sub_metering_3, col="blue")
  legend("topright",col=c("black", "red", "blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1,bty="n")
  #bottom right plot
  plot(DateTime,Global_reactive_power,type="l",xlab="datetime", ylab=colnames(subsetdata[4]))
})
dev.off()