## This script using dplyr and tidyr package
## install.packages(c("dplyr","tidyr")) ## Uncomment this if you have not this packages installed
library(tidyr)
## Read data
data <- read.table("household_power_consumption.txt", sep = ";", header =T, 
                   colClasses = c("character", "character", rep("numeric", 7)), na = "?")
## Subset data
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
## Unite Date and Time columns using tidyr
data <- data %>% unite(DateTime, Date, Time, sep = " ")
## convert DateTime into correct format
data$DateTime <- strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")
## Open png device
png(filename = "plot2.png")
## Create plot
par(mfrow = c(1,1))
with(data, plot(DateTime, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))
## close png device
dev.off()
