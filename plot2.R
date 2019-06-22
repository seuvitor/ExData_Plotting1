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

png("plot2.png", width = 480, height = 480)

with(powerData, plot(DateTime,
                     Global_active_power,
                     type = "l",
                     xlab = "",
                     ylab = "Global Active Power (kilowatts)"))
dev.off()
