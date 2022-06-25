library(lubridate)

# Step1: Reading data
my_data <- read.table(file.choose(), sep = ";", header = T)
str(my_data)

# Step 2: Convert Date variable from our data
my_data$Date <- as.Date(my_data$Date, "%d/%m/%Y")
my_data$full_date <- paste(my_data$Date, my_data$Time)
my_data$full_date <- as_datetime(my_data$full_date)

# Step 3: Choose data from the dates 2007-02-01 and 2007-02-02
my_data <- my_data[which(my_data$Date %in% as.Date(c("2007-02-01", "2007-02-02"))),]

# Step 4: Change Global Active Power variable to numeric
my_data$Global_active_power <- as.numeric(my_data$Global_active_power)

# Step 5: Change Sub_metering variable to numeric
for (i in 7:9) {
  my_data[,i] <- as.numeric(my_data[,i])
}

# Step 6: plot histogram of Global Active Power variable
png(filename="plot3.png", width=480, height = 480 )
with(my_data, plot(Sub_metering_1 ~ full_date, type = "l", xlab ="", ylab = "Energy Sub Metering"))
with(my_data, lines(Sub_metering_2 ~ full_date, col = "red"))
with(my_data, lines(Sub_metering_3 ~ full_date, col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"),
                              lwd = 1, cex = 0.8)
dev.off()
