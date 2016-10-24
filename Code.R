setwd("C:/Users/TatersAndTots/Documents/R_Coding/Mod_4/ExData_plotting1")


power <- subset(read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";"), Date == "1/2/2007" | Date == "2/2/2007")
power <- cbind(power[3:9], strptime(paste(power$Date, power$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S"))
colnames(power) <- c(names(power)[1:7], "Date_and_Time")

png("plot1.png", 480, 480)
hist(as.numeric(power$Global_active_power), main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")
dev.off

png("plot2.png", 480, 480)
with(power, plot(Date_and_Time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", yaxt = "n"))
axis(2, at = c(0,1000,2000,3000), lab = c("0", "2", "4", "6"))
dev.off()

png("plot3.png", 480, 480)
with(power, plot(Date_and_Time, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"), yaxt = "n")
axis(2, at = c(0,10,20,30), lab = c("0", "10", "20", "30"))
lines(power$Date_and_Time, power$Sub_metering_2, type = "l", col = "red")
lines(power$Date_and_Time, power$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1,1,1))
dev.off()


png("plot4.png", 480, 480)
par(mfrow = c(2,2))
with(power, plot(Date_and_Time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", yaxt = "n"))
axis(2, at = c(0,1000,2000,3000), lab = c("0", "2", "4", "6"))

with(power, plot(Date_and_Time, Voltage, type = "l", xlab = "datetime", ylab = "Voltage", yaxt = "n", lwd = .5))
axis(2, at = c(900, 1100, 1300, 1500, 1700, 1900, 2100), lab = c("234", "", "238", "", "242", "", "246"))

with(power, plot(Date_and_Time, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"), yaxt = "n")
lines(power$Date_and_Time, power$Sub_metering_2, type = "l", col = "red")
lines(power$Date_and_Time, as.factor(power$Sub_metering_3), type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1,1,1))

with(power, plot(Date_and_Time, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power", yaxt = "n", lwd = .5))
axis(2, at = c(0, 50, 100, 150, 200, 250), lab = c("0.0", "0.1", "0.2", "0.3", "0.4", "0.5"))
dev.off()