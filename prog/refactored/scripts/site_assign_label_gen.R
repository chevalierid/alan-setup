dates <- seq(as.Date("2023/6/21"),as.Date("2023/12/21"),by="5 days")
dates_out <- t(matrix(rep(dates,each=12),nrow=12))
dates_out <- as.data.frame(dates_out)
dates_out <- as.data.frame(lapply(dates_out, as.Date, format = "%Y-%m-%d",origin="1970-01-01"))

sites <- as.data.frame(matrix(rep(c(1:12),each=37),nrow=37))

# create site assignments
seq1 <- c("C","W","C","A")
seq2 <- c(seq1[-1],seq1[1])
seq3 <- c(seq2[-1],seq2[1])
seq4 <- c(seq3[-1],seq3[1])

site_settings <- t(cbind(rep(seq1,each=3),rep(seq2,each=3),rep(seq3,each=3),rep(seq4,each=3)))

set.seed(1)
assignments <- sample(1:12)

site_settings <- site_settings[, c(assignments)]
site_settings <- site_settings[rep(1:nrow(site_settings),times=10), ]
site_settings_out <- as.data.frame(matrix(site_settings[1:37,],nrow=37))
#site_settings_out <- as.data.frame(site_settings[,rep(1:12,each=2)])

labels <- data.frame(dates_out=dates_out,sites=sites,site_settings=site_settings_out)

# we want [1,13,25]
# [i, i+12, i+24]
order <- matrix(1:36,nrow=12)
order <- matrix(t(order),nrow=1)

labels <- labels[, c(order)]

#site_labels <- rep(sites,length(dates),each=3)

labels_out <- as.data.frame(sapply(seq(1,ncol(labels),by=3),function(i)
  do.call(paste,c(sep="_",as.data.frame(labels[, i:(i+2)])))))

############ uncomment to generate CSV
#write.table(labels_out,file="site_states.csv", sep=",", row.names=FALSE, col.names=FALSE)

# to_csv <- sprintf(paste(labels_out, collapse=','))
# cat(to_csv,file = "site_labels_test.csv")

