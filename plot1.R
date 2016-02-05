
datos <- read.table(file = "household_power_consumption.txt", header = TRUE,
           sep = ";", dec = ".")
sapply(datos, class)
subconjunto <- datos[datos$Date %in% c("1/2/2007","2/2/2007") ,]

globalActivePower <- as.numeric(subconjunto$Global_active_power)
hist(globalActivePower, col="green", main="Global Active Power", xlab="Global Active Power (kilowatts)")
