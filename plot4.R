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

# set par() order top left->right -> bottom left->right
par(mfrow=c(2,2))
# set suitable margin
# par("mar")
par(mar=c(4,4,4,2))

# graph 1 (topleft)
plot(rownames(power_Data),
     power_Data$Global_active_power,
     type="l",
     xaxt="n",
     xlab="",
     ylab="Global Active Power (kilowatts)",
     cex.lab=0.7,
     cex.axis=0.7
)
axis(1,at=seq(0,2880,1440),labels=c("Thu","Fri","Sat"),cex.axis=0.7)

# graph 2 (topright)
plot(rownames(power_Data),
     power_Data$Voltage,
     type="l",
     xaxt="n",
     xlab="datetime",
     ylab="Voltage",
     cex.lab=0.7,
     cex.axis=0.7
)
axis(1,at=seq(0,2880,1440),labels=c("Thu","Fri","Sat"),cex.axis=0.7)

# graph 3 (bottom left)
plot(rownames(power_Data),
     power_Data$Sub_metering_1,
     type="n",
     xaxt="n",
     xlab="",
     yaxt="n",
     ylab="Energy sub metering",
     cex.axis=0.7,
     cex.lab=0.7)

# amend to x & y axis
axis(1,at=seq(0,2880,1440),labels=c("Thu","Fri","Sat"),cex.axis=0.7)
axis(2,at=seq(0,30,10),labels=c(0,10,20,30),cex.axis=0.7)

# line filled for each sub meter with different colours;
lines(rownames(power_Data),power_Data$Sub_metering_1)
lines(rownames(power_Data),power_Data$Sub_metering_2,col="red")
lines(rownames(power_Data),power_Data$Sub_metering_3,col="blue")

# attach legend
legend("topright",col=c("black","red","blue"),
       lty=1,bty="n",cex=0.6,colnames(power_Data[7:9]))

# graph 4 (bottom right)
plot(rownames(power_Data),
     power_Data$Global_reactive_power,
     type="l",
     xaxt="n",
     xlab="datetime",
     ylab="Global_reactive_power",
     cex.lab=0.7,
     cex.axis=0.7
)
axis(1,at=seq(0,2880,1440),labels=c("Thu","Fri","Sat"),cex.axis=0.7)

# output into png
dev.copy(png,file="plot4.png",width = 480, height = 480)
dev.off
