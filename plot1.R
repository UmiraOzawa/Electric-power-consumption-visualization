
# Step1: Reading data
my_data <- read.table(file.choose(), sep = ";", header = T)
str(my_data)

# Step 2: Convert Date variable from our data
my_data$Date <- as.Date(my_data$Date, "%d/%m/%Y") 

# Step 3: Choose data from the dates 2007-02-01 and 2007-02-02
my_data <- my_data[which(my_data$Date %in% as.Date(c("2007-02-01", "2007-02-02"))),]

# Step 4: Change Global Active Power variable to numeric
my_data$Global_active_power <- as.numeric(my_data$Global_active_power)

# Step 5: plot histogram of Global Active Power variable
png(filename="plot1.png", width=480, height = 480 )
hist(my_data$Global_active_power, col = "red", ylab = "Frequency", xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")
dev.off()
