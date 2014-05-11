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
#plot 2
png(filename = "plot2.png", width = 480, height = 480)

days <- as.POSIXct(strptime(paste(dataDate$Date, dataDate$Time), format='%d/%m/%Y %H:%M:%S'))
plot(a, type="l", xlab="", ylab="Global Active Power (kilowatts)",xaxt="n")
axis(1, at=c(1,length(days)/2+1,length(days)),labels=c("Thu","Fri","Sat"))
dev.off()
#used axis code found at https://class.coursera.org/exdata-002/forum/thread?thread_id=51
