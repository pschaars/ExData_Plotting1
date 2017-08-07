file <- "household_power_consumption.txt"                            
power <- read.csv(file, sep=";", na.strings = "?")
power$datetime <- as.POSIXct(paste(power$Date, power$Time, sep = " "), format="%d/%m/%Y %H:%M:%S")
power$Date <- as.Date(power$Date, "%d/%m/%Y")
power <- power[power$Date >= "2007-02-01" & power$Date <= "2007-02-02",]
power <- power[!is.na(power$Global_active_power), ]
png("plot2.png", width = 480, height = 480)
plot(Global_active_power ~ datetime, power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()