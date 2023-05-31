# [date of deployment] - [site ID] - [control, white, or amber]
# 2023-06-21: - 1:12 - [C,W,A]
# FIXME need to randomly assign which sites are on which setting
  # 2023-06-21 - 1 - C
  # 2023-06-21 - 2 - C
  # 2023-06-21 - 3 - W
  # ...

dates <- seq(as.Date("2023/6/21"),as.Date("2023/12/21"),by="5 days")
dates <- matrix(rep(dates,each=12),nrow=12)
dates <- t(dates)

sites <- matrix(rep(c(1:12),each=37),nrow=37)

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
site_settings <- site_settings[1:37,]

labels <- cbind(dates,sites,site_settings)

# we want [1,13,25]
# [i, i+12, i+24]
order <- matrix(1:36,nrow=12)
order <- matrix(t(order),nrow=1)

labels <- labels[, c(order)]

site_labels <- rep(sites,length(dates),each=3)
