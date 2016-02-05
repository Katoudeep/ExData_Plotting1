
datos <- read.table(file = "household_power_consumption.txt", header = TRUE,
           sep = ";", dec = ".")
sapply(datos, class)
subconjunto <- datos[datos$Date %in% c("1/2/2007","2/2/2007") ,]

tiempo <- strptime(paste(subconjunto$Date, subconjunto$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
var1 <- as.numeric(subconjunto$Global_active_power)
plot(tiempo, var1, type="l", xlab="", ylab="Global Active Power (kilowatts)")
