household_power_consumption <- read.table("~/R/household_power_consumption.txt",sep=";",header=TRUE)
household_power_consumption_2days <- subset(household_power_consumption,(Date=="1/2/2007" | Date == "2/2/2007"))
df2<-household_power_consumption_2days
df2$Global_active_power <- as.numeric(as.character(df2$Global_active_power))
png("Plot2.png", width=480, height=480)
df2$DateTime <- strptime(paste(df2$Date,df2$Time), format = "%d/%m/%Y %H:%M:%S", tz= "PST8PDT")
plot(df2$DateTime,df2$Global_active_power, type = "l", ylab="Global Active Power(kilowatts)", xlab=" ")
dev.off()
