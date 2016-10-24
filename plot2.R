power <- subset(read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";"), Date == "1/2/2007" | Date == "2/2/2007")
power <- cbind(power[3:9], strptime(paste(power$Date, power$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S"))
colnames(power) <- c(names(power)[1:7], "Date_and_Time")

png("plot2.png", 480, 480)
with(power, plot(Date_and_Time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", yaxt = "n"))
axis(2, at = c(0,1000,2000,3000), lab = c("0", "2", "4", "6"))
dev.off()