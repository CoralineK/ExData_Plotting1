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

png("plot3.png")
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
       lty = 1)
dev.off()

