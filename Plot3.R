
	
##reading and cleaning data in order to have only days 1/2/2007 and 2/2/2007
	data = read.table("household_power_consumption.txt", sep = ";")
	cnames = readLines("household_power_consumption.txt", 1)
	cnames = strsplit(cnames, ";", fixed = TRUE)
	names(data) = cnames[[1]]
	data = data[-1,]
	data = data[which(data$Date %in% c("1/2/2007", "2/2/2007")),]
	
##Converting Date/Time column into datetime format
	p = paste(data[,"Date"], data[, "Time"])
	time = strptime(p, "%d/%m/%Y %H:%M:%S")

##plotting curves in png file

	png("Plot3.png")

	plot(time, data[,"Sub_metering_1"],  type = "l",col = "blue", xlab = "days" , ylab = "Energy sub metering")	
	lines(time, data[,"Sub_metering_2"],  type = "l",col="red")
	lines(time, data[,"Sub_metering_3"],  type = "l",col="green")
	legend( "topright", legend =c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),  
		col=c("blue","red", "green"), lty=1, cex=0.8)

	dev.off()
	
