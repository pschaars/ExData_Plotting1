file <- "household_power_consumption.txt"                            
power <- read.csv2(file, na.strings = "?")
power$datetime <- as.POSIXct(paste(power$Date, power$Time, sep = " "), format="%d/%m/%Y %H:%M:%S")
power$Date <- as.Date(power$Date, "%d/%m/%Y")
power <- power[power$Date >= "2007-02-01" & power$Date <= "2007-02-02",]
power <- power[!is.na(power$Global_active_power), ]
power$Global_active_power <- as.numeric(power$Global_active_power)
power$Sub_metering_1 <- as.numeric(power$Sub_metering_1)
power$Sub_metering_2 <- as.numeric(power$Sub_metering_2)
power$Sub_metering_3 <- as.numeric(power$Sub_metering_3)
png("plot3.png", width=480, height=480)
plot(Sub_metering_1 ~ datetime, power, type="l", xlab="", ylab="Energy sub metering")
lines(Sub_metering_2 ~ datetime, power, col="red")
lines(Sub_metering_3 ~ datetime, power, col="blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lty=1)
dev.off()