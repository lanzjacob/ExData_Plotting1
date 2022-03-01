#Read data
df <- read.table("household_power_consumption.txt", header=TRUE, sep=";", 
                 na.strings="?")

#Convert Date column to date format
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")

#Filter data - 2007-02-01 to 2007-02-02
df <- df[(df$Date == "2007-02-01" | df$Date == "2007-02-02"),]

#Set Global_active_power as numeric values
df$Global_active_power <- as.numeric(df$Global_active_power)

#Generate Histogram
png("plot1.png", 480, 480)
hist(df$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", col="Red")
dev.off()