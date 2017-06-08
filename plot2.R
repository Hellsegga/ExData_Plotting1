library(lubridate)
library(dplyr)

cons <- read.table("household_power_consumption.txt",sep=";", header=TRUE)
cons <- mutate(cons, Date = dmy(Date))
c <- cons[cons$Date=="2007-02-01" | cons$Date=="2007-02-02",]

c <- mutate(c, dt=paste(Date,Time,sep=" "))
c <- mutate(c, dt=ymd_hms(dt))

#figure 2
f2 <- function(){
  plot(c$dt, c$Global_active_power, type="l", ylab="Global Active Power (kilowatts)")
  dev.copy(png,'plot2.png', width=480, height=480)
  dev.off()
}