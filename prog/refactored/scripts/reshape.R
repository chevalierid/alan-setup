format_master <- function(filename) {
  data <- read.csv(filename)
  #data <- na.omit(data)
  data$Timestamp <- as.POSIXct(data$Timestamp, format="%d-%m-%Y", origin = "1970-01-01",tz="PDT")
  data$Folder <- as.numeric(data$Folder)
  data$Site <- as.numeric(data$Site)

  # expandvars <- c(colnames(data)[2:length(colnames(data))])

  # data <- reshape(data,
  #                 varying=list(expandvars),
  #                 v.names="status",
  #                 idvar="Date",
  #                 #new.row.names=sequence(prod(length(expandvars), nrow(data))),
  #                 direction="long")
  data <- data[order(data$Timestamp),]
  colnames(data) <- c("Timestamp","LabelledSite","Status","Folder","Site")
  rownames(data) <- NULL
  return(data)
}

# tdata <- read.csv("./prog/Collection Date Site Treatment and Notes.csv")
# tdata$Timestamp <- as.POSIXct(tdata$Timestamp, format="%d-%m-%Y", origin = "1970-01-01",tz="PDT")
# tdata$Folder <- as.numeric(tdata$Folder)
# tdata$Site <- as.numeric(tdata$Site)

status_table <- format_master("../raw_data/Collection Date Site Treatment and Notes.csv")
setDT(status_table)



#write.csv(data,file="Long Collection Date, Site Treatment, & Notes.csv")
 