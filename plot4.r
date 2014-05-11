#we only want to read the data from 2007-02-01 to 2007-02-02 and because
#the file is so big we must do the following to only read what we want

data <- read.table("household_power_consumption.txt", header=T, sep=";")
data$Date <- as.Date(data$Date, format='%d/%m/%Y')
dataDate <- data[data$Date %in% as.Date(c('2007-02-01', '2007-02-02')),]

names(dataDate)
attach(dataDate)

nrow(dataDate)
head(dataDate)
#------------------
#plot 4
a<- as.numeric(as.character(Global_active_power))
v<- as.numeric(as.character(Voltage))
gr <- as.numeric(as.character(Global_reactive_power))
days <- as.POSIXct(strptime(paste(dataDate$Date, dataDate$Time), format='%d/%m/%Y %H:%M:%S'))
one <- as.numeric(as.character(Sub_metering_1))
two <- as.numeric(as.character(Sub_metering_2))
three <- as.numeric(as.character(Sub_metering_3))

png(filename = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
days <- as.POSIXct(strptime(paste(dataDate$Date, dataDate$Time), format='%d/%m/%Y %H:%M:%S'))
plot(a, type="l", xlab="", ylab="Global Active Power",xaxt="n")
axis(1, at=c(1,length(days)/2+1,length(days)),labels=c("Thu","Fri","Sat"))

plot(v, type="l", xlab="datetime", ylab="Voltage", xaxt="n")
axis(1, at=c(1,length(days)/2+1,length(days)),labels=c("Thu","Fri","Sat"))

plot(one,type="l",xlab="", ylab="Energy sub metering", xaxt="n")
axis(1, at=c(1,length(days)/2+1,length(days)),labels=c("Thu","Fri","Sat"))
lines(two, type="l", col="red")
lines(three, type="l", col="blue")
legend("topright", col=c("black", "red", "blue"),lty=1,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")

plot(gr, type="l", xlab="datetime", ylab="Global_reactive_power", xaxt="n")
axis(1, at=c(1,length(days)/2+1,length(days)),labels=c("Thu","Fri","Sat"))
dev.off()