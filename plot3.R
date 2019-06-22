library(dplyr)

powerData <- tbl_df(read.csv("household_power_consumption.txt",
                             header = TRUE,
                             stringsAsFactors = FALSE,
                             sep = ";",
                             na.strings = "?"))

powerData <- filter(powerData, Date == "1/2/2007" |  Date == "2/2/2007")

powerData <- mutate(powerData,
                    DateTime = as.POSIXct(strptime(paste(Date, Time),
                                                   "%d/%m/%Y %H:%M:%S")))

png("plot3.png", width = 480, height = 480)

with(powerData, plot(DateTime,
                     Sub_metering_1,
                     type = "n",
                     xlab = "",
                     ylab = "Energy sub metering"))

with(powerData, points(DateTime, Sub_metering_1, type = "l", col = "black"))
with(powerData, points(DateTime, Sub_metering_2, type = "l", col = "red"))
with(powerData, points(DateTime, Sub_metering_3, type = "l", col = "blue"))

with(powerData, legend("topright",
                       legend = c("Sub_metering_1",
                                  "Sub_metering_2",
                                  "Sub_metering_3"),
                       lty = 1,
                       col = c("black", "red", "blue")))

dev.off()
