library(lubridate)
library(dplyr)

cons <- read.table("household_power_consumption.txt",sep=";", header=TRUE)
cons <- mutate(cons, Date = dmy(Date))
c <- cons[cons$Date=="2007-02-01" | cons$Date=="2007-02-02",]

c <- mutate(c, dt=paste(Date,Time,sep=" "))
c <- mutate(c, dt=ymd_hms(dt))

#figure 1
f1 <- function(){
  hist(c$Global_active_power, main ="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")
  dev.copy(png,'plot1.png', width=480, height=480)
  dev.off()
}

#figure 2
f2 <- function(){
  plot(c$dt, c$Global_active_power, type="l", ylab="Global Active Power (kilowatts)")
  dev.copy(png,'plot2.png', width=480, height=480)
  dev.off()
}

#figure 3
f3 <- function(){
  plot(c$dt, c$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(c$dt, c$Sub_metering_2, type="l", col="red")
  lines(c$dt, c$Sub_metering_3, type="l", col="blue")
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), lwd=c(2.5,2.5,2.5),col=c("black", "red","blue"))
  dev.copy(png,'plot3.png', width=480, height=480)
  dev.off()
}

f4 <- function(){
  par(mfrow=c(2,2))
  f2()
  plot(c$dt, c$Voltage, type="l", ylab="Voltage", xlab="datetime")
  f3()
  plot(c$dt, c$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
  dev.copy(png,'plot4.png', width=480, height=480)
  dev.off()
}