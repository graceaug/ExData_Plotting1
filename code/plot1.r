#load data
setwd("C:/Data_wd/GitHub/ExData_Plotting1")
filename = "./data/household_power_consumption.txt"
powerdata = read.table(filename,header=TRUE,sep=";",colClasses = c("character","character","numeric", "numeric", "numeric", "numeric","numeric","numeric","numeric"),na.strings = "?")
subsetdata <- powerdata[powerdata$Date == "1/2/2007" | powerdata$Date == "2/2/2007",]
datetime <- paste(subsetdata$Date, subsetdata$Time)
subsetdata$DateTime = strptime(datetime,"%d/%m/%Y %H:%M:%S")

#plot1
png(filename="./myfigure/plot1.png",width=480,height=480,units="px",bg="white")
hist(subsetdata$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")
dev.off()