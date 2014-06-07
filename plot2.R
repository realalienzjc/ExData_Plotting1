


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
        power.data$weekday <- weekdays(power.data$Date)
        png(filename="plot2.png", width=480, height=480)
        Sys.setlocale("LC_TIME", "en_US.UTF-8")
        plot(x=power.data$Time ,y=power.data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
        axis(1, at=1:3, lab=c("Thu", "Fri", "Sat"))
        dev.off() 
} else {
        print("power.data is not generated correctly!")
}







