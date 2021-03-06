## Get Data Set
dataset <- read.table("./household_power_consumption.txt",header=T,sep=";",na.strings="?")

## Subset Data
data_sub <- subset(dataset, dataset$Date == "1/2/2007" | dataset$Date == "2/2/2007")

## Transform Data
data_sub$Date <- as.Date(data_sub$Date, format="%d/%m/%y")
data_sub$Time <- strptime(data_sub$Time, format="%H:%M:%S")
data_sub[1:1440,"Time"] <- format(data_sub[1:1440,"Time"],"2007-02-01 %H:%M:%S")
data_sub[1441:2880,"Time"] <- format(data_sub[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

## Plot
plot(data_sub$Time, data_sub$Sub_metering_1, type="n",
     xlab="", ylab="Energy sub metering")
with(data_sub,lines(data_sub$Time, data_sub$Sub_metering_1, type="l"))
with(data_sub,lines(data_sub$Time, data_sub$Sub_metering_2,type="l",col="red"))
with(data_sub,lines(data_sub$Time, data_sub$Sub_metering_3,type="l",col="blue"))

legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col=c("black","red","blue"))

## Save File
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
