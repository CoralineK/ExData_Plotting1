# library(lubridate)
# library(dplyr)
# 
# data_URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
# download.file(data_URL, destfile = "./UCI.zip", method = "curl")
# unzip("./UCI.zip")
# 
# data <- read.table("./household_power_consumption.txt",
#                    sep = ";", 
#                    header = TRUE,
#                    stringsAsFactors = FALSE, 
#                    na.strings = "?") %>%
#     filter(Date == "1/2/2007" | Date == "2/2/2007") %>%
#     mutate(Date = dmy(Date)) %>%
#     mutate(Time = hms(Time)) %>%
#     mutate(date_time = Date + Time)

png("plot4.png")
# Divide graphics device into 2 rows & 2 columns
par(mfcol = c(2,2))
# Plot 1
plot(data$date_time, 
     data$Global_active_power, 
     type = "l", 
     xlab = NA,
     ylab = "Global Active Power")
# Plot 2
plot(data$date_time, 
     data$Sub_metering_1, 
     type = "l", 
     xlab = NA, 
     ylab = "Energy sub metering")
points(data$date_time, 
       data$Sub_metering_2, 
       type = "l", 
       col = "red")
points(data$date_time, 
       data$Sub_metering_3, 
       type = "l", 
       col = "blue")
legend(x = "topright", 
       legend = colnames(data)[7:9], 
       col = c("black", "red", "blue"), 
       lty = 1, 
       bty = "n")
# Plot 3
plot(data$date_time, 
     data$Voltage, 
     type = "l", 
     xlab = "datetime", 
     ylab = "Voltage")
#Plot 4
plot(data$date_time, 
     data$Global_reactive_power, 
     type = "l",
     xlab = "datetime",
     ylab = colnames(data)[4])
dev.off()

