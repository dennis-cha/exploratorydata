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
plot(data_sub$Time, data_sub$Global_active_power, type="l", 
     main="Global Active Power vs. Time", xlab="", ylab="Global Active power (kilowatts)")

## Save File
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()