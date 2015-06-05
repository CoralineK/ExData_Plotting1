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

png("plot2.png")
plot(data$date_time, 
     data$Global_active_power, 
     type = "l", 
     xlab = NA,
     ylab = "Global Active Power (kilowatts)")
dev.off()

