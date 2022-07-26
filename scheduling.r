rm(list=ls())

library(maptools)
library(data.table)

# Lat, Long
LOCATION  <- c(+49.250811969024724, 
			 -123.2388863)
DIRECTION <- c('sunrise', 'sunset')
MAX_FUTURE_DAYS <- 1e3

crds=matrix(rev(LOCATION), nrow=1)
all_dates <- Sys.Date() + 1:MAX_FUTURE_DAYS

query_table <- as.data.table(expand.grid(direction=DIRECTION, date=all_dates))
query_table[, id := 1:.N]


process_one_row <- function(dir, date){

	maptools::sunriset(crds,
		               direction=as.character(dir),
		               dateTime=as.POSIXct(date),
		               POSIXct.out=TRUE)$time[1]
                   }
                   
query_table[, value := process_one_row(direction, date), by=id]

query_table[, delta_t := round(c(as.numeric(diff(value), units='secs'),NA))]
query_table <- na.omit(query_table)

# get delta_t only and concat its values into a string delimited by commas
# convert posix to unix
# in makefile, concatenate strings into file.cpp.template
# get first of times that we have converted to unix timestamp minus # days btwn 1970 and 2000
delta_t_str <- paste(toString(query_table$delta_t), sep = ",")


define <- sprintf("const unsigned long[] {%s}\n#define START_TIME %i", paste(delta_t_str, collapse=','), as.integer(query_table$value[1])-946684800)
cat(define)



