#Reading File with Header value and NA string
Power_cons_data <-  read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
# Set the Date formate using as.Date() and  strptime
Power_cons_data$Date = as.Date(strptime(Power_cons_data$Date, "%d/%m/%Y"))
Date_filter <- Power_cons_data[Power_cons_data$Date %in% as.Date(c("2007-02-01", "2007-02-02")),]
#Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels. 
png(filename="plot2.png", width = 480, height = 480)

Time_format <- strptime(paste(Date_filter$Date, Date_filter$Time), format="%Y-%m-%d %H:%M:%S")

plot(Time_format, 
     Date_filter$Global_active_power, 
     type="l", 
     xlab="Day",
     ylab="Global Active Power (kilowatts)")

dev.off()
