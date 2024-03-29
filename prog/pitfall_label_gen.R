rm(list = ls(all = TRUE))
# [date of deployment] - [site ID] - [control, white, or amber]
# 2023-06-21: - 1:12 - [C,W,A]
# FIXME need to randomly assign which sites are on which setting
  # 2023-06-21 - 1 - C
  # 2023-06-21 - 2 - C
  # 2023-06-21 - 3 - W
  # ...

# dates <- seq(as.POSIXct("2023/6/21", tz="PDT"),as.POSIXct("2023/12/21", tz="PDT"),by="5 days")
# dates <- matrix(rep(dates,each=12),nrow=12)
# dates <- t(as.POSIXct(as.numeric(dates),origin="1970-01-01"))
# dates_out <- as.Date(dates)

dates <- seq(as.Date("2023/6/21"),as.Date("2023/12/21"),by="5 days")
dates_out <- t(matrix(rep(dates,each=24),nrow=24))
#df[, cols <- grep("^DATE", names(df))] <- lapply(df[, cols <- grep("^DATE", names(df))], as.Date, format = "%y%m%d")
dates_out <- as.data.frame(dates_out)
dates_out <- as.data.frame(lapply(dates_out, as.Date, format = "%Y-%m-%d",origin="1970-01-01"))

#dates <- rep(dates,each=12)
#dates_out <- data.frame(dates)


#dates <- t(mapply(dates, origin="1970-01-01", FUN = as.POSIXct))
#dates <- t(mapply(dates, tz = "PDT", FUN = format))

sites <- matrix(rep(c(1:12),each=37),nrow=37)
sites <- as.data.frame(matrix(rep(sites[,1:12],each=2),nrow=37))

#create 0m and 5m alternating
pf_id <- as.data.frame(matrix(rep(rep(c("0m","5m"),12),each=37),nrow=37))

# create our 12 columns
seq1 <- c("C","W","C","A")
seq2 <- c(seq1[-1],seq1[1])
seq3 <- c(seq2[-1],seq2[1])
seq4 <- c(seq3[-1],seq3[1])

site_settings <- t(cbind(rep(seq1,each=3),rep(seq2,each=3),rep(seq3,each=3),rep(seq4,each=3)))

set.seed(1)
assignments <- sample(1:12)

site_settings <- site_settings[, c(assignments)]
site_settings <- site_settings[rep(1:nrow(site_settings),times=10), ]
site_settings <- matrix(site_settings[1:37,],nrow=37)
site_settings_out <- as.data.frame(site_settings[,rep(1:12,each=2)])

labels <- data.frame(dates_out=dates_out,sites=sites,site_settings=site_settings_out,pf_id=pf_id)

# labels <- cbind(dates_out,sites,site_settings)
# labels[,1:12] <- as.Date(labels[,1:12],origin="1970-01-01")
# labels[,1:12] <- t(mapply(labels[,1:12], origin="1970-01-01", tz="PDT", FUN = as.Date))

# we want [1,25,49]
# [i, i+24, i+48]
order <- matrix(1:96,nrow=24)
order <- matrix(t(order),nrow=1)

labels <- labels[, c(order)]

#site_labels <- rep(sites,length(dates),each=3)

labels_out <- as.data.frame(sapply(seq(1,ncol(labels),by=4),function(i)
  do.call(paste,c(sep="_",as.data.frame(labels[, i:(i+3)])))))

# n <- 3
# tmp <- site_labels[-1]
# 
# cbind(site_labels[1], 
#       sapply(split.default(tmp, ceiling(seq_along(tmp)/n)), 
#              function(x) do.call(paste(sep = "_"), x)))

write.table(labels_out,file="site_labels_test.csv", sep=",", row.names=FALSE, col.names=FALSE)

# to_csv <- sprintf(paste(labels_out, collapse=','))
# cat(to_csv,file = "site_labels_test.csv")

