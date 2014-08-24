#Reading File with Header value and NA string
Power_cons_data <-  read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
# Set the Date formate using as.Date() and  strptime
Power_cons_data$Date = as.Date(strptime(Power_cons_data$Date, "%d/%m/%Y"))
Date_filter <- Power_cons_data[Power_cons_data$Date %in% as.Date(c("2007-02-01", "2007-02-02")),]
#Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels. 
png(filename="plot4.png", width = 480, height = 480)

Time_format <- strptime(paste(Date_filter$Date, Date_filter$Time), format="%Y-%m-%d %H:%M:%S")

par(mfrow=c(2,2))
plot(Time_format, 
     Date_filter$Global_active_power, 
     type="l", 
     xlab="Day",
     ylab="Global Active Power")
plot(Time_format, 
     Date_filter$Voltage, 
     type="l", 
     xlab="datetime",
     ylab="Voltage")
plot(Time_format, 
     Date_filter$Sub_metering_1,
     col="black",
     type="l", 
     xlab="Day",
     ylab="Global Active Power (kilowatts)")
lines(Time_format, Date_filter$Sub_metering_2, col="red")
lines(Time_format, Date_filter$Sub_metering_3, col="blue")
legend(x="topright", lty=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"))
plot(Time_format, 
     Date_filter$Global_reactive_power, 
     type="l", 
     xlab="datetime",
     ylab="Global_reactive_power")

dev.off()
