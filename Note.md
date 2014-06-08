


## Forum Note



#### International characters on plots

Using axis()	

	#  assume date/times convert:
	d$DateTime <- as.POSIXct( strptime(paste(d$Date, d$Time), "%d/%m/%Y %H:%M:%S"))  

	# custom X-axis processing, turned off with xaxt="n"
	plot(d$DateTime, ..., xaxt="n")
	axis(1, at=c(min(d$DateTime), min(d$DateTime)+86400,
                              min(d$DateTime)+2*86400),
    labels=c("Thu", "Fri", "Sat"))

source: 
<https://class.coursera.org/exdata-003/forum/thread?thread_id=133>


Using ?Sys.setlocale

	Klaus-Dieter Schmatz
	You can set the locale in RStudio as follows:
	Sys.setlocale(locale = "C")

	Ya-Ting Chan:
	Sys.setlocale(category = "LC_TIME", locale = "C")
	Sys.setlocale(category = "LC_ALL", locale = "")
	Here's how I change the LC_TIME category and then restore all categories back to the default locale for my system. Thanks.

	Oliver Haag:
	Setting the locale with
	Sys.setlocale(category = "LC_TIME", locale = "C")
	worked. But the reset with
	Sys.setlocale(category = "LC_ALL", locale = "")
	fails for me on OS X 10.9.2:

	Samuel G:
	I reset the locale with
	Sys.setlocale(locale = "")   

source: <https://class.coursera.org/exdata-003/forum/thread?thread_id=43>




