# due to the file size, I will only import the lines that are required for each plotting
# open a connection
con<-file("household_power_consumption.txt")
open(con)
# read exact positions from file
power_Data<-read.table(con,skip=66637,nrow=2880,sep=";")
# close the connection
close(con)
# proper labelling names
colnames(power_Data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
                          "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

# set suitable margin
par(mar=c(2,4,1,1))
# plot(x,y) with x axis left empty to be filled separately
plot(rownames(power_Data),
     power_Data$Global_active_power,
     type="l",
     xaxt="n",
     xlab="",
     ylab="Global Active Power (kilowatts)",
     cex.lab=0.7,
     cex.axis=0.7
)
# amend to x axis
axis(1,at=seq(0,2880,1440),labels=c("Thu","Fri","Sat"),cex.axis=0.7)

# output into png
dev.copy(png,file="plot2.png",width = 480, height = 480)
dev.off