Plot2
power <- read.table("C:\\Users\\KANHAIYA LAL JALAN\\Desktop\\coursera\\household_power_consumption.txt", sep= ";", header = T, na.string = "?", nrows=2075259, check.names=F, stringsAsFactors=F,)
sub_power <- subset(power, Date %in% c("1/2/2007","2/2/2007"))
sub_power$Date <- as.Date(sub_power$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(sub_power$Date), sub_power$Time)
sub_power$Datetime <- as.POSIXct(datetime)
with(sub_power, {plot(Global_active_power~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")})
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()