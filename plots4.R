file <- "household_power_consumption.txt"                            
power <- read.csv(file, sep=";", na.strings = "?")
power$datetime <- as.POSIXct(paste(power$Date, power$Time, sep = " "), format="%d/%m/%Y %H:%M:%S")
power$Date <- as.Date(power$Date, "%d/%m/%Y")
power <- power[power$Date >= "2007-02-01" & power$Date <= "2007-02-02",]
power <- power[!is.na(power$Global_active_power), ]
png("plot4.png", width=480,height=480)
par(mfrow=c(2,2))
plot(Global_active_power ~ datetime, power, type="l", xlab="", ylab="Global Active Power")
plot(Voltage ~ datetime, power, type="l", ylab="Voltage", xlab="datetime")
plot(Sub_metering_1 ~ datetime, power, type="l", xlab="", ylab="Energy sub metering")
lines(Sub_metering_2 ~ datetime, power, col="red")
lines(Sub_metering_3 ~ datetime, power, col="blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lty=1, bty="n")
plot(Global_reactive_power ~ datetime, power, type="l", ylab="Global_reactive_power", xlab="datetime")
dev.off()