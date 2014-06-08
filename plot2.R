


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



# For generating plot2.png
file <- "./household_power_consumption.txt"
power.data <- get_data(file)  # force reload data

if ( ! is.null(power.data)){
        png(filename="plot2.png", width=480, height=480)
        plot(x=power.data$Time ,y=power.data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)",xaxt="n")
        axis(1, at=c(min(as.POSIXct(power.data$Time)), min(as.POSIXct(power.data$Time))+86400,
                     min(as.POSIXct(power.data$Time))+2*86400),labels=c("Thu", "Fri", "Sat"))
        dev.off() 
} else {
        print("power.data is not generated correctly!")
}







