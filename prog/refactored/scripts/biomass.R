library(ggplot2)
library(data.table)

biomass <- fread("../raw_data/Pitfall_Trap_Biomass_Data.csv")
biomass$StartDate <- as.Date(biomass$StartDate, origin = "1970-01-01")
metatable <- fread("../cleaned_data/metadata.csv")
metatable <- metatable[!is.na(Site)]

biomass <- dcast(biomass, StartDate+Site~Distance, value.var=c("Biomass"))
setnames(biomass, c("0m","5m"), c("Near","Far"))
biomass[metatable, Treatment := i.Treatment, on=.(Site, StartDate)]


biomass[, Index := Far/(Near+Far), by = .(StartDate,Site)]

biomass <- biomass[Treatment %in% c("A","C","W")]

biomass$Treatment <- factor(biomass$Treatment, levels=c("C","W","A"), ordered = TRUE)

ggplot(biomass, aes(Treatment, Index)) +
  geom_boxplot() +
  labs(y = "Biomass statistic") +
  geom_jitter() +
  geom_hline(aes(yintercept = 0.5),colour="red",linetype="dotted")




dcast(foo,group+num_users~times,value.var=c("action_rate","action_rate_c95"))






pdf("../plots/biomass.pdf", w=16, h=9)
ggplot(data=interp_table[Site == 6 & LightOn == 1 & Timestamp %between% c(as.POSIXct("2023-07-01"), as.POSIXct("2023-08-01"))]) +
  geom_point(aes(x=Timestamp,y=Intensity,colour=as.factor(Treatment))) +
  geom_point(aes(x=Timestamp,y=AS03),colour="blue") +
  geom_point(aes(x=Timestamp,y=AS06),colour="orange")
dev.off()


















# source("reshape.R")
# 
# master <- format_master("Collection_Date_Site_Treatment_Notes.csv")
# 
# master
# biomass
# head(master)
# # want to select rows of biomass where master status is blank
# 
# master[master$Status=="",]$Date
# 
# dim(biomass[biomass$Treatment=="A",])
# dim(biomass[biomass$Treatment=="C",])
# dim(biomass[biomass$Treatment=="W",])
# 
# status_good <- biomass[biomass$Date %in% master[master$Status=="",]$Date,]
# status_good <- status_good[status_good$Treatment!= "",]
# 
# dim(status_good[status_good$Treatment=="A",])
# dim(status_good[status_good$Treatment=="C",])
# dim(status_good[status_good$Treatment=="W",])
# 
# status_good[status_good$Distance=="0m",]
# # Date, Site, Treatment, Distance:
#   # let's try to make 3 datasets:
#   # 1 for each treatment
#   # each dataset has all sites averaged per date
# 
# 
# summary_biomass <- status_good[status_good$Distance=="0m" & status_good$Date <= as.POSIXct("2023-08-30 PDT"),] %>%
#   group_by(Date,Treatment) %>%
#   summarise(across(c(Biomass),list(mean=mean)))
# 
# summary_biomass
# 
# bmplot <- ggplot(data=summary_biomass, aes(x=Date, y=Biomass_mean, color=Treatment)) +
#   geom_point() +
#   scale_color_manual(values=c("C" = "black",
#                               "W" = "blue",
#                               "A" = "orange"))
# bmplot
#   
#   
#   pberry <- ggplot(data=dfb2, aes(x=reorder(berry_species,-mean_pupae$x), y=dfb2$mean_pupae$x)) + 
#   geom_boxplot() + xlab("Berry species") + ylab("Pupae per sample") + 
#   ggtitle("2022 SWD pupae per sample by berry species") +
#   theme_bw() +
#   theme(axis.line = element_line(colour = "black"),
#         panel.grid.major = element_blank(),
#         panel.grid.minor = element_blank(),
#         panel.border = element_blank(),
#         panel.background = element_blank()) 
# 
# pberry
# 
# 
# lets <- c("A","A","B","B", "C","C","D","D")
# nums <- c("1","3","5","6","7","8","9","10")
# d <- data.frame(lets=lets,nums=nums)
# d[3,1]
# d[d$lets=="A",]
# subs <- c("A","C")
# d[d$lets %in% subs,]
# 
# 
# 
# set.seed(1)
# 
# sample_df <- data.frame(
#   group=factor(rep(letters[1:3],each=10)),
#   value=rnorm(30),
#   day=rep(1:10,times=3)
# )
# 
# sample_df
# 
# aggregate(x = sample_df$value, by = list(sample_df$group,sample_df$day), FUN = "mean")
# 
# group_means_df <- setNames(
#   aggregate(value, by(day,group), sample_df, mean),
#   c("day","group_mean")
# )
# group_means_df
# 
# ggplot(data = sample_df, mapping = aes(x = group, y = value)) +
#   geom_point() +
#   geom_point(
#     mapping = aes(y=group_mean), data = group_means_df,
#     colour = 'red', size = 3
#   )
