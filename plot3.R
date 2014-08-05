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
par(mar=c(2,4,2,1))

# plot(x,y) with type="n" to construct the structure
plot(rownames(power_Data),
     power_Data$Sub_metering_1,
     type="n",
     xaxt="n",
     xlab="",
     yaxt="n",
     ylab="Energy sub metering",
#      ylim=c(0,30),
     cex.axis=0.7,
     cex.lab=0.7
)

# amend to x & y axis
axis(1,at=seq(0,2880,1440),labels=c("Thu","Fri","Sat"),cex.axis=0.7)
axis(2,at=seq(0,30,10),labels=c(0,10,20,30),cex.axis=0.7)

# line filled for each sub meter with different colours;

lines(rownames(power_Data),power_Data$Sub_metering_1)

lines(rownames(power_Data),power_Data$Sub_metering_2,col="red")

lines(rownames(power_Data),power_Data$Sub_metering_3,col="blue")

# attach legend
legend("topright",col=c("black","red","blue"),
       lty=1,cex=0.6,colnames(power_Data[7:9]))

# output into png
dev.copy(png,file="plot3.png",width = 480, height = 480)
dev.off
