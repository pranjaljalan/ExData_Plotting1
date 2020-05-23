power <- read.table("C:\\Users\\KANHAIYA LAL JALAN\\Desktop\\coursera\\household_power_consumption.txt", sep= ";", header = T, na.string = "?", nrows=2075259, check.names=F, stringsAsFactors=F,)
sub_power <- subset(power, Date %in% c("1/2/2007","2/2/2007"))
sub_power$Date <- as.Date(sub_power$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(sub_power$Date), sub_power$Time)
sub_power$Datetime <- as.POSIXct(datetime)
 with(sub_power, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,  legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()