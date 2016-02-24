


## read the data from the .txt file
	data = read.table("household_power_consumption.txt", sep = ";")

## rename the headline and selecting data from the 2 dates
	cnames = readLines("household_power_consumption.txt", 1)
	cnames = strsplit(cnames, ";", fixed = TRUE)
	names(data) = cnames[[1]]
	data = data[-1,]
	data = data[which(data$Date %in% c("1/2/2007", "2/2/2007")),]

## construct the histogram showing the frequency of Global Active Power and save in png
	png("Plot1.png")
	hist(as.numeric(select$Global_active_power), col = "red",main = "Global active power", xlab = "Global active power")
	dev.off()

