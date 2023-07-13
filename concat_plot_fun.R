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
  
  # site <- "10"
  # start_date <- "0"
  # end_date <- "1"
  # #start_date <- "2023-06-29 00:00:00"
  # #end_date <- "2023-07-10 00:00:00"
  # var <- "i"
  # print(identical(site,"01"))
  # print(identical(start_date,"2023-06-29 00:00:00"))
  # print(identical(end_date,"2023-07-10 00:00:00"))
  # print(identical(var,"s"))
  
  dir_name <- paste("site", site, sep = "")
  
  mypath <- paste(mypath, dir_name, sep = "/")
  
  all_files <- list.files(path = mypath,full.names = TRUE, pattern = "*CSV")
  #print(all_files)
  
  files_ls <- all_files[file.size(all_files) > 0]
  
  all_data <- do.call(rbind,lapply(files_ls,function(file) {
    read.csv(file)
  }))
  
  for (file in files_ls) {
    #print(file)
    read.csv(file)
  }
  
  #summary(all_data)
  
  all_data$Timestamp <- as.POSIXct(all_data$Timestamp, origin = "1970-01-01")
  all_data <- all_data[order(all_data$Timestamp), ]
  
  #head(all_data$Timestamp)
  #tail(all_data$Timestamp)
  
  start <- as.POSIXct(start_date, format="%Y-%m-%d %H:%M:%S")
  end <- as.POSIXct(end_date,format="%Y-%m-%d %H:%M:%S")
  
  zero <- as.POSIXct("0", format="%Y-%m-%d %H:%M:%S")
  one <- as.POSIXct("1",format="%Y-%m-%d %H:%M:%S")
  
  if (identical(start,zero) || 
      start < head(all_data$Timestamp,1) ||
      start > tail(all_data$Timestamp,1)) {
    start <- head(all_data$Timestamp,1)
  }
  
  if (identical(end,one) ||
      end < head(all_data$Timestamp,1) ||
      end > tail(all_data$Timestamp,1)) {
    end <- tail(all_data$Timestamp,1)
  }
  
  plot_data <- all_data[(all_data$Timestamp >= start) & (all_data$Timestamp <= end),]
  print(plot_data)
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
  } else if (identical(var,"l")) {
    p.plot <- ggplot(data = plot_data, mapping = aes(x=Timestamp, y=Intensity)) +
      geom_line() +
      ylim(0,250) +
      ggtitle(paste("Intensity plotted against time for site",site)) +
      xlab("Date") +
      ylab("Counts")
  }
  print(p.plot)
  return(list(p.plot,plot_data))
  #return(list(p.plot,plot_data))
}

output <- concat_dir("11", "2023-07-09 21:50:00", "2023-07-10 02:00:00", "i")
output <- concat_dir("08", "0", "1", "l")
concat_dir("11","0","1","l")
