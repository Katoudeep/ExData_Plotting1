
datos <- read.table(file = "household_power_consumption.txt", header = TRUE,
           sep = ";", dec = ".")
sapply(datos, class)
subconjunto <- datos[datos$Date %in% c("1/2/2007","2/2/2007") ,]

tiempo <- strptime(paste(subconjunto$Date, subconjunto$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
var1 <- as.numeric(subconjunto$Global_active_power)
plot(tiempo, var1, type="l", xlab="", ylab="Global Active Power (kilowatts)")

sub1 <- as.numeric(subconjunto$Sub_metering_1)
sub2 <- as.numeric(subconjunto$Sub_metering_2)
sub3 <- as.numeric(subconjunto$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(tiempo, sub1, type="l", ylab="Energy Submetering", xlab="")
lines(tiempo, sub2, type="l", col="green")
lines(tiempo, sub3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
