
##read data, cleaning and selecting dates 1/2/2007 and 2/2/2007 

	data = read.table("household_power_consumption.txt", sep = ";")
	cnames = readLines("household_power_consumption.txt", 1)
	cnames = strsplit(cnames, ";", fixed = TRUE)
	names(data) = cnames[[1]]
	data = data[-1,]
	data = data[which(data$Date %in% c("1/2/2007", "2/2/2007")),]
	
##datetime conversion and plotting in a png file
	png("Plot2.png", width = 480, height = 480, units = "px")

	p = paste(data[,"Date"], data[, "Time"])
	time = strptime(p, "%d/%m/%Y %H:%M:%S")
	plot(time, data[,"Global_active_power"], type = "l",xlab = "days", ylab = "global active power(kilowatts)")	
	
	dev.off()
	
