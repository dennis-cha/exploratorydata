## Get Data Set
dataset <- read.table("./household_power_consumption.txt",header=T,sep=";",na.strings="?")

## Subset Data
data_sub <- subset(dataset, dataset$Date == "1/2/2007" | dataset$Date == "2/2/2007")

## Plot
hist(data_sub$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Save File
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
