file <- "household_power_consumption.txt"                            
power <- read.csv2(file, na.strings = "?")
power$Date <- as.Date(power$Date, "%d/%m/%Y")
power$Global_active_power <- as.numeric(power$Global_active_power)
power <- power[power$Date >= "2007-02-01" & power$Date <= "2007-02-02",]
power <- power[!is.na(power$Global_active_power), ]
png("plot1.png", width=480, height=480)
hist(power$Global_active_power, xlim = c(0, 6000), xlab = "Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power", col="red")
dev.off()