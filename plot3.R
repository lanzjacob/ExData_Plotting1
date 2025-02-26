#Read data
df <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

#Convert Date column to date format
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")

#Filter data - 2007-02-01 to 2007-02-02
df <- df[(df$Date == "2007-02-01" | df$Date == "2007-02-02"),]

#Set Global_active_power as numeric values
df$Global_active_power <- as.numeric(df$Global_active_power)

#Merge Date and Time
df$DateTime <- as.POSIXct(paste(df$Date, df$Time), format="%Y-%m-%d %H:%M:%S")

#Plot data
png("plot3.png", 480, 480)
plot(df$DateTime, df$Sub_metering_1, type = "l", col = "black",
     xlab = "", ylab = "Energy sub metering")
lines(df$DateTime, df$Sub_metering_2, col = "red")
lines(df$DateTime, df$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2",
                  "Sub_metering_3"))
dev.off()