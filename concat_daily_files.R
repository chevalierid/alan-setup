rm(list = ls(all = TRUE))
mypath = "~/Documents/alan_setup/2023_06_19_sd/"

#testfile <- read.csv(file="5-29-17.csv",header=T,sep=",")

files_ls <- list.files(path=mypath,pattern="*CSV")
files_df <- lapply(files_ls,function(x) {read.csv(file=paste(mypath,files_ls[1],sep=""),header=T,sep=",")})

all_data <- do.call(rbind,lapply(files_ls,function(file) {
  read.csv(paste(mypath,file,sep=""))
  }))

summary(all_data)

## start single file


single_file <- read.csv(file=paste(mypath,"5-29-23.csv",sep=""),header=T,sep=",")
single_file$Timestamp <- as.POSIXct(single_file$Timestamp, origin = "1970-01-01",tz="PDT")

plot(single_file$Timestamp, single_file$Intensity, format = "%m-%d %H:%M", type="l", xlab="Timestamp",
     ylab="Intensity", main="Intensity plotted against time for daily light switching",
     pch=1)


## end single file



all_data$Timestamp <- as.POSIXct(all_data$Timestamp, origin = "1970-01-01")
all_data <- all_data[order(all_data$Timestamp), ]

head(all_data$Timestamp)
tail(all_data$Timestamp)

bound1 <- as.POSIXct("2023-05-29 00:00:00", 
                     format="%Y-%m-%d %H:%M:%S")

bound2 <- as.POSIXct("2023-05-30 18:00:00", 
                     format="%Y-%m-%d %H:%M:%S")

plot_data <- all_data[(all_data$Timestamp > bound1) & (all_data$Timestamp < bound2),]

plot_data <- all_data

# with (all_data[(all_data$Timestamp > bound1) & (all_data$Timestamp < bound2),], 
#   plot(Timestamp, AS00, type="l", xlab="Timestamp",
#   ylab="AS00", main="AS00 plotted against time for daily light switching",
#   pch=1))
plot(plot_data$Timestamp, plot_data$AS10, type="l", xlab="Timestamp",
       ylab="AS10", main="AS10 plotted against time for daily light switching",
       pch=1)
lines(plot_data$Timestamp, plot_data$AS11, col="grey", xlab="Timestamp", 
      ylab="AS11", main="AS11 plotted against time for daily light switching",
      pch=1)
lines(plot_data$Timestamp, plot_data$AS09, col="red", xlab="Timestamp", 
        ylab="AS09", main="AS09 plotted against time for daily light switching",
        pch=1)
lines(plot_data$Timestamp, plot_data$AS08, col="orange", xlab="Timestamp", 
      ylab="AS08", main="AS08 plotted against time for daily light switching",
      pch=1)
lines(plot_data$Timestamp, plot_data$AS07, col="goldenrod", xlab="Timestamp", 
        ylab="AS07", main="AS07 plotted against time for daily light switching",
        pch=1)
lines(plot_data$Timestamp, plot_data$AS06, col="yellow", xlab="Timestamp", 
      ylab="AS06", main="AS06 plotted against time for daily light switching",
      pch=1)
lines(plot_data$Timestamp, plot_data$AS05, col="green", xlab="Timestamp", 
      ylab="AS05", main="AS05 plotted against time for daily light switching",
      pch=1)
lines(plot_data$Timestamp, plot_data$AS04, col="skyblue", xlab="Timestamp", 
      ylab="AS04", main="AS04 plotted against time for daily light switching",
      pch=1)
lines(plot_data$Timestamp, plot_data$AS03, col="dodgerblue", xlab="Timestamp", 
      ylab="AS03", main="AS03 plotted against time for daily light switching",
      pch=1)
lines(plot_data$Timestamp, plot_data$AS02, col="blue", xlab="Timestamp", 
      ylab="AS02", main="AS02 plotted against time for daily light switching",
      pch=1)
lines(plot_data$Timestamp, plot_data$AS01, col="darkblue", xlab="Timestamp", 
      ylab="AS01", main="AS01 plotted against time for daily light switching",
      pch=1)
lines(plot_data$Timestamp, plot_data$AS00, col="purple", xlab="Timestamp", 
      ylab="AS00", main="AS00 plotted against time for daily light switching",
      pch=1)



plot(plot_data$Timestamp, plot_data$Intensity, type="l", xlab="Timestamp",
     ylab="Intensity", main="Intensity plotted against time for daily light switching",
     pch=1)

plot(plot_data$Timestamp, plot_data$On, type="l", xlab="Timestamp",
     ylab="On", main="On plotted against time for daily light switching",
     pch=1)

with (all_data,
      plot(Timestamp, On, type="l", xlab="Timestamp", format = "%m-%d %H", 
           ylab="On", main="On plotted against time for daily light switching",
           pch=1))



library(zoom)

#combined_df <- do.call("rbind",)