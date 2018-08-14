household_power_consumption <- read.table("~/R/household_power_consumption.txt",sep=";",header=TRUE)
household_power_consumption_2days <- subset(household_power_consumption,(Date=="1/2/2007" | Date == "2/2/2007"))

df2<-household_power_consumption_2days
df2$DateTime <- strptime(paste(df2$Date,df2$Time), format = "%d/%m/%Y %H:%M:%S", tz= "PST8PDT")

df2$Global_active_power <- as.numeric(as.character(df2$Global_active_power))
df2$Voltage<-as.numeric(as.character(df2$Voltage))
df2$Sub_metering_1 <- as.numeric(as.character(df2$Sub_metering_1))
df2$Sub_metering_2 <- as.numeric(as.character(df2$Sub_metering_2))
df2$Sub_metering_3 <- as.numeric(as.character(df2$Sub_metering_3))
df2$Global_reactive_power <- as.numeric(as.character(df2$Global_reactive_power))

png("Plot4.png", width=480, height=480)
par(mfrow=c(2,2), mar=c(4,5,2,1))

plot(df2$DateTime,df2$Global_active_power, type = "l", ylab="Global Active Power", xlab=" ")
plot(df2$DateTime, df2$Voltage, type='l', xlab= "datetime", ylab = "Voltage")
plot(df2$DateTime,df2$Sub_metering_1, col= "black", type ="l",xlab=" ", ylab = "Energy sub metering")
lines(df2$DateTime,df2$Sub_metering_2, col = "red")
lines(df2$DateTime,df2$Sub_metering_3, col = "blue")
legend("topright",col=c("black", "red", "blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1))
plot(df2$DateTime, df2$Global_reactive_power, type='l', xlab= "datetime", ylab = "Global_reactive_power")
dev.off()
