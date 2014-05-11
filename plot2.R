# read data
consumption <- read.table("household_power_consumption.txt", header=TRUE, sep=";", 
                          na.string="?")

# convert column Date to Date format
consumption$Date <- as.Date(as.character(consumption$Date),format="%d/%m/%Y")

datesPerimeter <- c(as.Date("2007-02-01" , format="%Y-%m-%d"),
                    as.Date("2007-02-02" , format="%Y-%m-%d"))

# select data in the date perimeter
selection <- consumption[consumption$Date %in% datesPerimeter,]

# open png device
png(file="plot2.png",width=480,height=480)
# make the figure
# Sys.setlocale(category = "LC_TIME", locale = "C")
plot(strptime(paste(selection$Date,selection$Time),format="%Y-%m-%d %H:%M:%S"),
     selection$Global_active_power,
     xlab="",
     ylab="Global Active Power (kilowatts)",
     type="l")
# close file
dev.off()
# Sys.setlocale(category = "LC_TIME", locale = "")
