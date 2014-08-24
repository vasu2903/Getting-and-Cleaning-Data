#Reading File with Header value and NA string
Power_cons_data <-  read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
# Set the Date formate using as.Date() and  strptime
Power_cons_data$Date = as.Date(strptime(Power_cons_data$Date, "%d/%m/%Y"))
Date_filter <- Power_cons_data[Power_cons_data$Date %in% as.Date(c("2007-02-01", "2007-02-02")),]
#Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels. 
png(filename="plot1.png", width = 480, height = 480)
hist(Date_filter$Global_active_power , freq=TRUE ,ylab="Frequency", xlab="Global Active Power (kilowatts)" , main="Global Active Power",col="red")
dev.off()
