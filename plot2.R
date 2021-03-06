
plot2 <- function(){
  power <- read.table("household_power_consumption.txt", 
                      sep = ";", header = TRUE)
  pow <- power
  pow[,1] <- as.Date(pow[,1], format = "%d/%m/%Y")
  pow <- pow[pow$Date == "2007-02-01" | pow$Date == "2007-02-02",]
  pow[,2] <- paste(as.character(pow[,1]), as.character(pow[,2]))
  
  png(file = "plot2.png")
  plot(strptime(pow$Time, format = "%Y-%m-%d %H:%M:%S"), 
       as.numeric(as.character(pow$Global_active_power)), 
       type = "n", xlab = "", 
       ylab = "Global Active Power (kilowatts)")
  lines(strptime(pow$Time, format = "%Y-%m-%d %H:%M:%S"), 
        as.numeric(as.character(pow$Global_active_power)))
  dev.off()
}