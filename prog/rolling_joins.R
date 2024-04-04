# reprex
library(data.table)
library(ggplot2)
# bmtest table:
  # 10 biomass measurements
  # 10 dates
BmDate = seq.Date(from = as.Date("2023/06/01"), by = "5 days", length.out = 10)
set.seed(1)
bmtest <- data.table(
  BmDate,
  Biomass = rnorm(10, mean = 2, sd = 1)
)
bmtest

# stest table:
  # 7 sensor measurements
  # 7 dates
stest <- data.table(
  SDate = sort(sample(BmDate,7)),
  Sensor = rnorm(7, mean = 1000, sd = 300)
)
stest

setkey(stest,"SDate")
setkey(bmtest,"BmDate")
bmtest[stest, roll = TRUE]




# now to apply rolling joins to our actual data
# - table of biomass data
# - table of sensor measurements over time
# - want to associate each biomass datapoint with a sensor measurement

# first: need to download all the sensor data...
# s3cmd la
# s3cmd get --recursive s3://alan-stations-sensordata/

# s3cmd get --recursive s3://alan-stations-sensordata/

# stored in alan-setup/sensordata

setwd("~/Documents/alan-setup")

## bound the time frame within study period (hardcoded in here)
## to only download files that are from the correct timespan
## recall the format string is month.day.hour
start_date <- as.POSIXct("23.06.21.00",format="%y.%m.%d.%H")
end_date <- as.POSIXct("23.12.04.23",format="%y.%m.%d.%H")
all_dates <- seq.POSIXt(start_date, end_date, "hour")

all_dates <- format(all_dates,"%m-%d-%H")

## format file names as dates
## some are not possible dates e.g. (85-9-18)
## try catch
## remove CSV termination
reform <- function (site_files_arg) {
  site_files_arg <- gsub(".CSV|\"","",site_files_arg)
  site_files_arg <- gsub("^","23-",site_files_arg)
  site_files_arg <- as.POSIXct(site_files_arg,format="%y-%m-%d-%H")
  format(site_files_arg,"%m-%d-%H")
}


## get a list of all site paths
sites <- list.files(path="./sensordata", full.names = TRUE)

header <- c("Timestamp", "Site", "Amber", "White", "On", "Override", "Intensity",
               "AS00", "AS01", "AS02", "AS03", "AS04", "AS05", "AS06", "AS07", "AS08",
               "AS09", "AS10", "AS11")
# 1


# replaced sites[4] with site
get_files <- function(site) {
  files_within_bounds <- list.files(site)[reform(list.files(site)) %in% all_dates]
  # exclude blank files
  files_within_bounds <- files_within_bounds[file.size(paste(site,"/",files_within_bounds,sep=""))>0]
  site_table <- do.call(rbind,lapply(files_within_bounds,function(file) {
    data <- read.csv(paste(site,"/",file,sep=""))
    names(data) <- header
    return(data)
    # 2
  }))
}


# 3
raw_output <- lapply(sites,get_files)
big_table <- raw_output

# now we have a list of dataframes
# some have char columns only, other have int and num
# we'll have to convert them all
# the reason this was working before was because we were doing the POSIXct stuff first
# this nuked all the header rows that are in here for whatever reason
# by converting the timestamp column to POSIXct

# convert timestamp column to POSIXct
big_table <- lapply(big_table, function(df) {
  df$Timestamp <- as.POSIXct(as.numeric(df$Timestamp), origin = "1970-01-01")
  df <- subset(df, Timestamp > start_date & Timestamp < end_date)
})

 # 4
# convert all the other columns
big_table <- lapply(big_table, function(df) {
  #lapply(df, type.convert, as.is = TRUE)
  df[,-1] <- lapply(df[,-1], type.convert, as.is = TRUE)
  return(df)
    })
# 5


# merge into a single dataframe
# take unique values since some files were duplicated
big_table <- unique(rbindlist(big_table))


#red_big_table <- Reduce(function(x, y) merge(x, y, all=TRUE), big_table)
#tab_big_table <- as.data.table(red_big_table)

# catch bad/corrupted files where Site is 0
big_table <- big_table[big_table$Site %in% 1:12,]

# while we're here, get min and max timestamp
x_min <- min(big_table$Timestamp)
x_max <- max(big_table$Timestamp)

# split into list of dataframes, grouped by site number instead
#site_tables_list <- split(big_table, f=big_table$Site)
#site_tables_list <- lapply(site_tables_list,na.omit)


#lapply(sapply(big_table, '[[', "Timestamp"),min)



# create new x
# use linear interpolation (approxfun)
# floor(timestamp/300)*300
# ceil(||)
# seq(from, to, by=300)
# do all of this for one series


x_inter <- seq(floor(as.numeric(x_min)/300)*300,
    ceiling(as.numeric(x_max)/300)*300,
    by=300)

# quickly view how many NAs in each df
#lapply(big_table,function(df) sum(is.na(df)))
#summary(site_tables_list[[1]]$Intensity)
#lapply(big_table,summary)

# make column for treatment (converting amber/white/on)
  #   A W O Override
  # -------------------------
  #   0 1 1 0 white, on
  # -------------------------
  #   0 1 0 0 white, off
  # -------------------------
  #   0 1 1 1 white, off, override
  # -------------------------
  #   1 1 1 0 control, on
  # -------------------------
  #   1 1 0 0 control, off
  # -------------------------
  #   1 1 1 1 control, off, override
  # -------------------------
  #   1 0 1 0 amber, on
  # -------------------------
  #   1 0 0 0 amber, off
  # -------------------------
  #   1 0 1 1 amber, off, override

# remember, "on" has to do with night vs. day, not treatment vs. control
  
# how many observations actually have override triggered?
big_table[Override==1]
# just 5...

# compute treatment column as follows:
  # A & W
  # 

source("./prog/site_assign_label_gen.R")
dim(big_table)
dim(big_table[Amber==1 & White==1])
dim(big_table[Amber==0 & White==1])
dim(big_table[Amber==1 & White==0])
dim(big_table[Amber==0 & White==0])

str(labels)

long_labels <- melt(setDT(labels), measure = patterns(c("^dates_out","^sites","^site_settings")),
     value.name=c("dates_out","sites","site_settings"))

# we want to match our big_table against the labels
# first we have to convert our columns 

long_labels[,.SD
            ,by=sites]






# make long table with intensity as a channel



# group by site
big_table[,.SD
          ,by=Site]

approx_x <- function(subdata,x_inter_arg) {
  # returns x and y
  return(na.omit(as.data.table(approx(x = subdata$Timestamp, y = subdata$Intensity,
                              xout = x_inter_arg, method = "linear"))))
}



# can take SD as argument
# approx_table <- big_table[,approx_x(.SD,x_inter)
          # ,by=Site]

# make this work by converting treatment column
approx_table <- big_table[,approx_x(.SD,x_inter)
                          ,by=c("Site","Treatment")]


ggplot(approx_table, aes(x=x,y=y,colour=Site)) +
  geom_line()

ggplot(approx_table, aes(x=as.POSIXct(x, origin = "1970-01-01"),y=y)) +
  geom_line() +
  facet_wrap(~Site) +
  scale_x_datetime()




# another column
# approx_table[channels="Intensity"]
# grid: 





ggplot(approx_table, aes(x=as.POSIXct(x, origin = "1970-01-01"),y=y)) +
  geom_line() +
  facet_wrap(~Site) +
  scale_x_datetime(name="Date")




str(approx(x = site_tables_list[[1]]$Timestamp, y = site_tables_list[[1]]$Intensity,
              xout = x_inter, method = "linear"))

interp_1 <- approx(x = site_tables_list[[1]]$Timestamp, y = site_tables_list[[1]]$Intensity,
       xout = x_inter, method = "linear")
interp_1 <- as.data.frame(interp_1)

plot(na.omit(interp_1))

# median filter (runmed)



# 1
{
  #all.equal(header,unlist(names_1[1])
  #all_files <- lapply(sites,list.files)
  
  ## get a list of file names for given site
  #site_files <- list.files(sites[4])
  # length(reform(site_files))
  # length(all_dates)
  # length(reform(site_files)[reform(site_files) %in% all_dates])
  #files_within_bounds <- site_files[reform(site_files) %in% all_dates]
}

# 2
{    #print(names(data))
  #   #print(file)
  #   #try(print(names(read.csv(paste(site,"/",file,sep="")))))
  #   tryCatch(
  #     {
  #       all.equal(names(read.csv(paste(site,"/",file,sep=""))),header)
  #       read.csv(paste(site,"/",file,sep=""))
  #     },
  #     error=function(e) {
  #       read.csv(paste(site,"/",file,sep=""),header = FALSE)
  #     }
  #   )
  #   #names(data) <- header
}


# 3
{# #
  # si <- 3
  # files_within_bounds <- list.files(sites[si])[reform(list.files(sites[si])) %in% all_dates]
  # files_within_bounds <- files_within_bounds[file.size(paste(sites[si],"/",files_within_bounds,sep=""))>0]
  # site_table_1 <- lapply(files_within_bounds,function(file) {
  #   tryCatch(
  #     {
  #       read.csv(paste(sites[si],"/",file,sep=""))
  #     },
  #     error=function(e) {
  #       read.csv(paste(sites[si],"/",file,sep=""), header = FALSE)
  #     }
  #   )
  # })
  # 
  # names_1 <- lapply(site_table_1,names)
  # for (i in 1:length(names_1)) {
  #   #try (all.equal(names_1[i],names_1[1]))
  #   print(paste(i, files_within_bounds[i], names_1[i]))
  #   if (!all.equal(names_1[i],names_1[1])) {
  #     print(files_within_bounds[i])
  #   }
  # }
  # 
  # all.equal(tail(names_1,n=1),names_1[1])
  # 
  # 
  # all(sapply(names_1, identical, names_1[1]))
  # names_1[1]
  # 
  # files_within_bounds <- list.files(sites[3])[reform(list.files(sites[3])) %in% all_dates]
  # files_within_bounds <- files_within_bounds[file.size(paste(sites[3],"/",files_within_bounds,sep=""))>0]
  # site_table_3 <- lapply(files_within_bounds,function(file) {
  #   read.csv(paste(sites[3],"/",file,sep=""))
  # })
  # 
  # str(get_files(sites[1]))
  # str(get_files(sites[3]))
  # for (i in 1:length(files_within_bounds)) {
  #   print(files_within_bounds[i])
  #   rbind_debug <- rbind(rbind_debug, read.csv(paste(sites[3],"/",files_within_bounds[i],sep="")))
  # }
  # 
  # site_table <- do.call(rbind,lapply(files_within_bounds,function(file) {
  #   read.csv(paste(site,"/",file,sep=""))
  # }))
  #
}

# 4
{
  # # convert one single dataframe's columns
  # lapply(
  #   big_table[[1]],type.convert,as.is = TRUE)
  # # double-check this worked
  # lapply(
  #   lapply(
  #     big_table[[1]],type.convert,as.is = TRUE),class)
  
}

# 5
{
  # # double-check this worked
  # #lapply(
  # str(
  # lapply(
  #   big_table, function(df) {
  #     lapply(df,type.convert, as.is = TRUE)
  #   })
  # )
  # #  [1],class)
}
