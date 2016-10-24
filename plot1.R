power <- subset(read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";"), Date == "1/2/2007" | Date == "2/2/2007")
power <- cbind(power[3:9], strptime(paste(power$Date, power$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S"))
colnames(power) <- c(names(power)[1:7], "Date_and_Time")

png("plot1.png", 480, 480)
hist(as.numeric(power$Global_active_power), main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")
dev.off