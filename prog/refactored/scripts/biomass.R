library(ggplot2)
library(data.table)

biomass <- fread("./raw_data/Pitfall_Trap_Biomass_Data.csv")
biomass$StartDate <- as.Date(biomass$StartDate, origin = "1970-01-01")
metatable <- fread("./cleaned_data/metadata.csv")
metatable <- metatable[!is.na(Site)]

biomass <- dcast(biomass, StartDate+Site~Distance, value.var=c("Biomass"))
setnames(biomass, c("0m","5m"), c("Near","Far"))
biomass[metatable, Treatment := i.Treatment, on=.(Site, StartDate)]

biomass <- biomass[Treatment %in% c("A","C","W")]

biomass$Treatment <- factor(biomass$Treatment, levels=c("C","W","A"), ordered = FALSE)

biomass[, Total := Near + Far]

#biomass[, `:=` (MeanTotal = mean(Total), SDTotal = sd(Total)), by = .(StartDate, Treatment)]
#biomass[, SDTotal := s]

########### ANOVA ###########

biomass$Treatment <- as.factor(biomass$Treatment)

one_way <- aov(Near ~ Treatment, data = biomass)
summary(one_way)

# need to make table longer
long_biomass <- melt(biomass[,.SD,.SDcols = !c("Total")], id.vars = c("StartDate","Site","Treatment"), variable.name = "Distance")
long_biomass[Distance == "Near", `:=`(Distance = "0")]
long_biomass[Distance == "Far", `:=`(Distance = "5")]
setnames(long_biomass, "value", "Biomass")

one_way_long <- aov(Biomass ~ Treatment, data = long_biomass)
summary(one_way_long)

########### ANOVA WITH TRAP DISTANCE AS FACTOR ###########

two_way <- aov(Biomass ~ Treatment + Distance, data = long_biomass)
summary(two_way)

two_way_mult <- aov(Biomass ~ Treatment * Distance, data = long_biomass)
summary(two_way_mult)

#long <- melt(setDT(wide), id.vars = c("Code","Country"), variable.name = "year")

########### LINEAR MODELS ###########

library(car)

model <- lm(Near ~ Treatment, data = biomass)
summary(model)

model_long <- lm(Biomass ~ Treatment, data = long_biomass)
summary(model_long)

model_mult <- lm(Biomass ~ Treatment * Distance, data = long_biomass)
summary(model_mult)

model_julian <- lm(Biomass ~ Treatment * Distance * julian(StartDate), data = long_biomass)
summary(model_julian)

########### GLMMS ###########

library(glmmTMB)

# glmm_simple <- glmm(Biomass ~ Treatment, data = long_biomass)
# summary(glmm_simple)
# 
# glmm_julian <- glmm()

########### LINE GRAPH ############

# is biomass filtered by active sites (metatable)?
# yes

# create line graphs:
  # by Treatment (diff graphs)
    # + facet_grid(rows = vars(Treatment)) +
  # by StartDate (same graph)
    # aes(x = StartDate)
  # by Site (same graph)
    # colour = Site

pdf("./plots/biomass_all_points.pdf", w=16, h=9)
ggplot(biomass, aes(x = StartDate, y = Total, colour = as.factor(Site))) +
  geom_point() +
  geom_line() +
  labs(y= "Total Biomass") +
  facet_grid(rows = vars(Treatment))
dev.off()

pdf("./plots/biomass_points_stat.pdf", w=16, h=9)
ggplot(biomass[, Total, by=.(Site, StartDate, Treatment)], aes(x = StartDate, y = Total)) +
  stat_summary(fun = mean, geom = "point") +
  stat_summary(fun.data = mean_se, geom = "errorbar") + 
  labs(y="Mean Total Biomass") +
  facet_grid(rows = vars(Treatment))
dev.off()
  
# pdf("./plots/biomass_points.pdf", w=16, h=9)
# ggplot(biomass, aes(x = StartDate, y = MeanTotal)) +
#   geom_point() +
#   geom_errorbar(aes(ymin = MeanTotal - SDTotal, ymax = MeanTotal + SDTotal)) +
#   labs(y="Mean Total Biomass") +
#   facet_grid(rows = vars(Treatment))
# dev.off()


# plot again without splitting by site, plotting both mean and standard error

 

########### HISTOGRAM ############

filtered_biomass <- metatable[biomass, on = .(StartDate, Site), nomatch = 0]
filtered_biomass[metatable, Treatment := i.Treatment, on=.(Site, StartDate)]
filtered_biomass[, Total := Near + Far]

# divide the number of observations by the number of sites for each StartDate

filtered_biomass[, sum(Total), by = .(StartDate, Treatment)]

bcount_bar <- as.data.table(filtered_biomass[, .N, by=.(Site, StartDate)][, .N, by=StartDate][order(StartDate)])
setnames(bcount_bar, "N", "NumberOfSites")
bcount_bar
bcount_bar[, TotalBiomass := filtered_biomass[, sum(Total), by=StartDate]$V1]
bcount_bar[, Normalised := TotalBiomass/NumberOfSites]
ggplot(bcount_bar, aes(x=StartDate, y=Normalised)) +
  geom_col()


all_col <- obs_col_plot(filtered_biomass)
all_col + labs(y = "Total count divided by number of sites")

c_col <- obs_col_plot(filtered_biomass[Treatment == "C"])
c_col + labs(y = "Total count under control (darkness) divided by number of sites")

a_col <- obs_col_plot(filtered_biomass[Treatment == "A"])
a_col + labs(y = "Total count under amber light divided by number of sites")

w_col <- obs_col_plot(filtered_biomass[Treatment == "W"])
w_col + labs(y = "Total count under white light divided by number of sites")

col_list <- c(all_col, c_col, a_col, w_col)

do.call("grid.arrange", c(col_list, ncol=1))



filtered_biomass[, .N, by=.(StartDate, Site, Treatment)][, .N, by=.(Treatment)]
filtered_biomass[Treatment == "", .N, by=.(StartDate, Site)][order(StartDate)][order(StartDate, Site)]


########### INDEX ############

biomass[, Index := Near/(Near+Far), by = .(StartDate,Site)]

ggplot(biomass, aes(Treatment, Index)) +
  geom_boxplot(outlier.shape = NA) +
  labs(y = "Biomass statistic") +
  geom_jitter() +
  geom_hline(aes(yintercept = 0.5),colour="red",linetype="dotted")


wilcoxon_biomass <- data.frame(W = wilcox.test(biomass[Treatment == ("W"),Index], biomass[Treatment == ("C"),Index], 
            alternative = "two.sided", exact = FALSE)$p.value,
            A = wilcox.test(biomass[Treatment == ("A"),Index], biomass[Treatment == ("C"),Index], 
            alternative = "two.sided", exact = FALSE)$p.value)

wilcoxon_biomass

############ 1m rather than index ############

ggplot(biomass, aes(Treatment, Near)) +
  geom_boxplot(outlier.shape = NA) +
  labs(y = "Biomass statistic") +
  geom_jitter() +
  geom_hline(aes(yintercept = 0.5),colour="red",linetype="dotted")


wilcoxon_biomass_one <- data.frame(W = wilcox.test(biomass[Treatment == ("W"),Near], biomass[Treatment == ("C"),Near], 
                                               alternative = "two.sided", exact = FALSE)$p.value,
                                   A = wilcox.test(biomass[Treatment == ("A"),Near], biomass[Treatment == ("C"),Near], 
                                               alternative = "two.sided", exact = FALSE)$p.value)

wilcoxon_biomass_one

############ 5m ############

ggplot(biomass, aes(Treatment, Far)) +
  geom_boxplot(outlier.shape = NA) +
  labs(y = "Biomass statistic") +
  geom_jitter() +
  geom_hline(aes(yintercept = 0.5),colour="red",linetype="dotted")


wilcoxon_biomass_one <- data.frame(W = wilcox.test(biomass[Treatment == ("W"),Far], biomass[Treatment == ("C"),Far], 
                                                   alternative = "two.sided", exact = FALSE)$p.value,
                                   A = wilcox.test(biomass[Treatment == ("A"),Far], biomass[Treatment == ("C"),Far], 
                                                   alternative = "two.sided", exact = FALSE)$p.value)

wilcoxon_biomass_one





# pdf("../plots/biomass.pdf", w=16, h=9)
# ggplot(data=interp_table[Site == 6 & LightOn == 1 & Timestamp %between% c(as.POSIXct("2023-07-01"), as.POSIXct("2023-08-01"))]) +
#   geom_point(aes(x=Timestamp,y=Intensity,colour=as.factor(Treatment))) +
#   geom_point(aes(x=Timestamp,y=AS03),colour="blue") +
#   geom_point(aes(x=Timestamp,y=AS06),colour="orange")
# dev.off()


















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
