
datos <- read.table(file = "household_power_consumption.txt", header = TRUE,
           sep = ";", dec = ".")
sapply(datos, class)
subconjunto <- datos[datos$Date %in% c("1/2/2007","2/2/2007") ,]

tiempo <- strptime(paste(subconjunto$Date, subconjunto$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
var1 <- as.numeric(subconjunto$Global_active_power)
sub1 <- as.numeric(subconjunto$Sub_metering_1)
sub2 <- as.numeric(subconjunto$Sub_metering_2)
sub3 <- as.numeric(subconjunto$Sub_metering_3)
var2 <- as.numeric(subconjunto$Global_reactive_power)
var3 <- as.numeric(subconjunto$Voltage)

par(mfrow = c(2, 2)) 

plot(tiempo, sub1, type="l", ylab="Energy Submetering", xlab="")
lines(tiempo, sub2, type="l", col="green")
lines(tiempo, sub3, type="l", col="blue")
plot(tiempo, var1, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(tiempo, var3, type="l", xlab="datetime", ylab="Voltage")
plot(tiempo, var2, type="l", xlab="datetime", ylab="Global_reactive_power")

