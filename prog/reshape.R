format_master <- function(filename) {
  data <- read.csv(filename)
  data$Date <- as.POSIXct(data$Date, format="%d-%b-%y", origin = "1970-01-01",tz="PDT")
  
  expandvars <- c(colnames(data)[2:length(colnames(data))])
  
  data <- reshape(data,
                  varying=list(expandvars),
                  v.names="status",
                  idvar="Date",
                  #new.row.names=sequence(prod(length(expandvars), nrow(data))),
                  direction="long")
  data <- data[order(data$Date),]
  colnames(data) <- c("Timestamp","Site","Status")
  rownames(data) <- NULL
  return(data)
}
status_table <- format_master("./prog/Collection_Date_Site_Treatment_Notes.csv")
setDT(status_table)

#write.csv(data,file="Long Collection Date, Site Treatment, & Notes.csv")
 