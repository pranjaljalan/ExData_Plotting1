Plot4
power <- read.table("C:\\Users\\KANHAIYA LAL JALAN\\Desktop\\coursera\household_power_consumption.txt", sep= ";", header = T, na.string = "?", nrows=2075259, check.names=F, stringsAsFactors=F,)
sub_power <- subset(power, Date %in% c("1/2/2007","2/2/2007"))
sub_power$Date <- as.Date(sub_power$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(sub_power$Date), sub_power$Time)
sub_power$Datetime <- as.POSIXct(datetime)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(sub_power, { plot (Global_active_power~Datetime, type="l",  ylab="Global Active Power ", xlab="")})
with(sub_power, {plot ( Voltage~Datetime, type="l",  ylab="Voltage", xlab="datetime")})
with(sub_power, {plot (Sub_metering_1~Datetime, type="l", 
                              ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})
with(sub_power, { plot(Global_reactive_power~Datetime, type="l", ylab="Global_reactive_power ",xlab="datetime")})
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()