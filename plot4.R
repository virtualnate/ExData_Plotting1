
plot4 <- function(){
  power <- read.table("household_power_consumption.txt", 
                      sep = ";", header = TRUE)
  pow <- power
  pow[,1] <- as.Date(pow[,1], format = "%d/%m/%Y")
  pow <- pow[pow$Date == "2007-02-01" | pow$Date == "2007-02-02",]
  pow[,2] <- paste(as.character(pow[,1]), as.character(pow[,2]))
  
  png(file = "plot4.png")
  par(mfcol = c(2,2))
  
  plot(strptime(pow$Time, format = "%Y-%m-%d %H:%M:%S"), 
       as.numeric(as.character(pow$Global_active_power)), 
       type = "n", xlab = "", 
       ylab = "Global Active Power")
  lines(strptime(pow$Time, format = "%Y-%m-%d %H:%M:%S"), 
        as.numeric(as.character(pow$Global_active_power)))
  
  plot(strptime(pow$Time, format = "%Y-%m-%d %H:%M:%S"), 
       as.numeric(as.character(pow$Sub_metering_1)), type = "n", 
       xlab = "", ylab = "Energy sub metering")
  lines(strptime(pow$Time, format = "%Y-%m-%d %H:%M:%S"), 
        as.numeric(as.character(pow$Sub_metering_1)))
  lines(strptime(pow$Time, format = "%Y-%m-%d %H:%M:%S"), 
        as.numeric(as.character(pow$Sub_metering_2)), col = "red")
  lines(strptime(pow$Time, format = "%Y-%m-%d %H:%M:%S"), 
        as.numeric(as.character(pow$Sub_metering_3)), col = "blue")
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", 
        "Sub_metering_3"), lty = c(1,1,1), 
         col = c("black", "red", "blue"), bty = "n")
  
  plot(strptime(pow$Time, format = "%Y-%m-%d %H:%M:%S"), 
       as.numeric(as.character(pow$Voltage)), 
       type = "n", xlab = "datetime", ylab = "Voltage")
  lines(strptime(pow$Time, format = "%Y-%m-%d %H:%M:%S"), 
        as.numeric(as.character(pow$Voltage)))
  
  plot(strptime(pow$Time, format = "%Y-%m-%d %H:%M:%S"), 
       as.numeric(as.character(pow$Global_reactive_power)), 
       type = "n", xlab = "datetime", 
       ylab = "Global_reactive_power")
  lines(strptime(pow$Time, format = "%Y-%m-%d %H:%M:%S"), 
        as.numeric(as.character(pow$Global_reactive_power)))
  
  dev.off()
}