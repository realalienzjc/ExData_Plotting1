



# setup data
get_data <- function(file){
        if(file.exists(file)) {
                df <- read.csv(file, header=T, sep=";", na.string="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
                df$Date <- strptime(df$Date, format="%d/%m/%Y") 
                df$Time <- strptime(paste( strftime(df$Date, format="%Y-%m-%d"), df$Time), format="%Y-%m-%d %H:%M:%S")  
                pd <- df[ as.Date(df$Date) >  (as.Date("2007-02-01")-1) & as.Date(df$Date) < (as.Date("2007-02-02")+1) , ]
                pd
        } else {
                print("Target data file  ... not found")
                NULL
        }    
}


# plots
plot4_1 <- function(){
        plot(x=power.data$Time ,y=power.data$Global_active_power, type="l", xlab="", ylab="Global Active Power")
        axis(1, at=1:3, lab=c("Thu", "Fri", "Sat"))
}


plot4_2 <- function(){
        plot(x=power.data$Time ,y=power.data$Voltage, type="l", xlab="datetime", ylab="Voltage")
        axis(1, at=1:3, lab=c("Thu", "Fri", "Sat"))
}

plot4_3 <- function(){
        plot(x=power.data$Time ,y=power.data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
        lines(x=power.data$Time ,y=power.data$Sub_metering_2, col="red")
        lines(x=power.data$Time ,y=power.data$Sub_metering_3, col="blue")
        legend(x="topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), box.lwd = 0, lwd=c(2,2,2),col=c("black", "red", "blue"))
        axis(1, at=1:3, lab=c("Thu", "Fri", "Sat"))
}

plot4_4 <- function(){
        plot(x=power.data$Time ,y=power.data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
        axis(1, at=1:3, lab=c("Thu", "Fri", "Sat"))
}

# For generating plot4.png
file <- "./household_power_consumption.txt"
power.data <- get_data(file)  # force reload data

if ( ! is.null(power.data)){
        power.data$weekday <- weekdays(power.data$Date)
        png(filename="plot4.png", width=480, height=480)
        par(mfrow=c(2,2))
        Sys.setlocale("LC_TIME", "en_US.UTF-8")
        plot4_1()
        plot4_2()
        plot4_3()
        plot4_4()
        dev.off()
}






