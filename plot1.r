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
#plot 1
png(filename = "plot1.png", width = 480, height = 480)

a<- as.numeric(as.character(Global_active_power))
hist(a, main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")
dev.off()
