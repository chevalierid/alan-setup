# create function to concatenate + plot one site's stuff
# parameters: 
  # site number
  # start date in YYYY-MM-DD
  # end date in YYYY-MM-DD
  # variable to plot (intensity or spectrum)
rm(list = ls(all = TRUE))
library(ggplot2)

concat_dir <- function(site,start_date,end_date,var) {

  mypath = "C:/Users/Public/Documents/ALANizer"
  
  # site <- "01"
  # start_date <- "2023-06-29 00:00:00"
  # end_date <- "2023-07-10 00:00:00"
  # var <- "s"
  # print(identical(site,"01"))
  # print(identical(start_date,"2023-06-29 00:00:00"))
  # print(identical(end_date,"2023-07-10 00:00:00"))
  # print(identical(var,"s"))
  
  dir_name <- paste("site", site, sep = "")
  
  mypath <- paste(mypath, dir_name, sep = "/")
  
  files_ls <- list.files(path=mypath,pattern="*CSV")
  print(files_ls)
  files_df <- lapply(files_ls,function(x) {
    read.csv(file=paste(mypath,files_ls[1],sep="/"),header=T,sep=",")
  })
  
  all_data <- do.call(rbind,lapply(files_ls,function(file) {
    read.csv(paste(mypath,file,sep="/"))
  }))
  
  #summary(all_data)
  
  all_data$Timestamp <- as.POSIXct(all_data$Timestamp, origin = "1970-01-01")
  all_data <- all_data[order(all_data$Timestamp), ]
  
  #head(all_data$Timestamp)
  #tail(all_data$Timestamp)
  
  start <- as.POSIXct(start_date, format="%Y-%m-%d %H:%M:%S")
  end <- as.POSIXct(end_date,format="%Y-%m-%d %H:%M:%S")
  
  if (identical(start,"0") || 
      start < head(all_data$Timestamp,1) ||
      start > tail(all_data$Timestamp,1)) {
    start <- head(all_data$Timestamp,1)
  }
  
  if (identical(end,"1") ||
      end < head(all_data$Timestamp,1) ||
      end > tail(all_data$Timestamp,1)) {
    end <- tail(all_data$Timestamp,1)
  }
  
  plot_data <- all_data[(all_data$Timestamp >= start) & (all_data$Timestamp <= end),]
  
  if (identical(var,"s")) {
    p.plot <- ggplot(data = plot_data, mapping = aes(x=Timestamp,y=AS10))+
      geom_line() +
      ggtitle(paste("Channels plotted against time for site",site)) +
      xlab("Date") +
      ylab("Counts") +
      geom_line(mapping = aes(y=AS11), colour="grey") +
      geom_line(mapping = aes(y=AS09), colour = "red") +
      geom_line(mapping = aes(y=AS08), colour = "orange") +
      geom_line(mapping = aes(y=AS07), colour = "goldenrod") +
      geom_line(mapping = aes(y=AS06), colour = "yellow") +
      geom_line(mapping = aes(y=AS05), colour = "green") +
      geom_line(mapping = aes(y=AS04), colour = "skyblue") +
      geom_line(mapping = aes(y=AS03), colour = "dodgerblue") +
      geom_line(mapping = aes(y=AS02), colour = "blue") +
      geom_line(mapping = aes(y=AS01), colour = "darkblue") +
      geom_line(mapping = aes(y=AS00), colour = "purple")
  } else if (identical(var,"i")) {
    p.plot <- ggplot(data = plot_data, mapping = aes(x=Timestamp, y=Intensity)) +
      geom_line() +
      ggtitle(paste("Intensity plotted against time for site",site)) +
      xlab("Date") +
      ylab("Counts")
    
  }
  print(p.plot)
  return(list(p.plot,plot_data))
  #return(list(p.plot,plot_data))
}

output <- concat_dir("04", "2023-06-29 00:00:00", "2023-07-10 00:00:00", "s")
