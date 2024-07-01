library(ggplot2)
library(data.table)
library(igraph)

all_pitfall_names <- fread("./raw_data/pitfall_classification_filenames.txt", header = FALSE)

setnames(all_pitfall_names, "V1", "FullName")
#2023-08-05_1_A_5m002_0040_5763_8740_0004.png
#StartDate_Site_Treatment_Distance

all_pitfall_names <- all_pitfall_names[grep("debris", FullName, invert = TRUE)]
all_pitfall_names <- all_pitfall_names[grep("multiple_insects", FullName, invert = TRUE)]
all_pitfall_names$FullName <- gsub(" ", "_", all_pitfall_names$FullName)
all_pitfall_names[, c("Root","Filename") := tstrsplit(FullName, "\\/+(?!\\S*\\/)", perl = TRUE)]
all_pitfall_names[, c("Root","Phylum","Class","Order","Family","Subfamily","Genus","Species") := tstrsplit(Root, "/")]
all_pitfall_names[, c("StartDate", "Site", "PrescribedTreatment", "Distance") := tstrsplit(Filename, "_", fixed = TRUE, type.convert = TRUE)[1:4]]
all_pitfall_names[, Distance := strtrim(Distance, 2)]
all_pitfall_names[, StartDate := as.Date(StartDate)]
all_pitfall_names[, id := .I]
all_pitfall_names <- all_pitfall_names[StartDate > as.Date("2023-06-21")]

metatable <- fread("./cleaned_data/metadata.csv")
metatable <- metatable[!is.na(Site)]

unique(all_pitfall_names[Family == "Carabidae"]$Subfamily)
all_pitfall_names[Family == "Carabidae", .N]

pitfall_names <- all_pitfall_names[metatable, Treatment := i.Treatment, on=.(Site, StartDate)]
pitfall_names <- pitfall_names[Treatment %in% c("A","C","W")]
pitfall_names$Treatment <- factor(pitfall_names$Treatment, levels=c("C","A","W"), ordered = FALSE)


########################

library(ggraph)
library(igraph)
library(tidyverse)
library(viridis)
library(gridExtra)

prepare_graph <- function(pitfall_subset) {

  count_pn <- pitfall_subset[, .N, by=.(Treatment, Root,Phylum,Class,Order,Family,Subfamily,Genus,Species)]
  
  
  #count_pn <- pitfall_names[Treatment == "C"][, .N, by=.(Treatment, Root,Phylum,Class,Order,Family,Subfamily,Genus,Species)]
  
  count_edges <- na.omit(rbind(
    data.frame(from=count_pn$Root, to=count_pn$Phylum),
    data.frame(from=count_pn$Phylum, to=count_pn$Class),
    data.frame(from=count_pn$Class, to=count_pn$Order),
    data.frame(from=count_pn$Order, to=count_pn$Family),
    data.frame(from=count_pn$Family, to=count_pn$Subfamily),
    data.frame(from=count_pn$Subfamily, to=count_pn$Genus),
    data.frame(from=count_pn$Genus, to=count_pn$Species)))
  count_edges <- unique(count_edges)
    
  count_name <- unique(c(as.character(count_edges$from),as.character(count_edges$to)))
  
  count_pn[, Depth := Reduce(`+`, lapply(.SD,function(x) !is.na(x))),.SDcols=taxa_cols]
  
  taxa_cols <- c("Root","Phylum","Class","Order","Family","Subfamily","Genus","Species")
  
  # get MSTL
  count_pn[, Name := NA_character_]
  for (v in rev(names(count_pn[,..taxa_cols]))) 
    count_pn[is.na(Name), Name := get(v)]
  
  setdiff(count_pn$Name,unique(c(count_edges$from,count_edges$to)))
  names_to_add <- setdiff(unique(c(count_edges$from,count_edges$to)),count_pn$Name)
  
  n_to_add <- rep(0,length(names_to_add))
  
  # add new rows in count_pn for the elements that aren't currently in there
    # get column # in count_pn[,..taxa_cols] for each name
  names_to_add
  # we have to lapply the column-finding across the whole array of names
  
  get_depth <- function(name, data) {
    return(data[, which(.SD==name, arr.ind = TRUE)][,2][[1]])
  }
  depths_to_add <- unlist(lapply(names_to_add,get_depth,data=count_pn[,..taxa_cols]))
  depths_to_add
  
  to_add <- data.frame(name = names_to_add,
                       value = n_to_add,
                       depth = depths_to_add)
  
  c_vertices <- data.frame(
    name=count_pn$Name,
    value=count_pn$N,
    depth=count_pn$Depth
  )
  
  c_vertices <- rbindlist(list(c_vertices,to_add))
  
  c_vertices$id=NA
  c_leaves=which(is.na(match(c_vertices$name, count_edges$from)))
  c_nleaves = length(c_leaves)
  c_vertices$id[c_leaves] = seq(1:c_nleaves)
  c_vertices$angle= 90 - 360 * c_vertices$id / c_nleaves
  c_vertices$hjust<-ifelse( c_vertices$angle < -90, 1, 0)
  c_vertices$angle<-ifelse(c_vertices$angle < -90, c_vertices$angle+180, c_vertices$angle)
  
  setdiff(c_vertices$name,unique(c(count_edges$from,count_edges$to)))
  setdiff(unique(c(count_edges$from,count_edges$to)),c_vertices$name)
  
  my_graph <- graph_from_data_frame(count_edges,vertices = c_vertices)
  
  return(my_graph)
}

random.seed(1)
control_graph <- prepare_graph(pitfall_names[Treatment == "C"])
random.seed(1)
white_graph <- prepare_graph(pitfall_names[Treatment == "W"])
random.seed(1)
amber_graph <- prepare_graph(pitfall_names[Treatment == "A"])



plot_list <- list(ggraph(control_graph, layout = 'circlepack', weight=value) + 
                    geom_node_circle(aes(fill=depth)) +
                    geom_node_label(aes(label=name,size=value),position=position_jitter(width=.2,height=.2),repel=TRUE,max.overlaps=10) +
                    theme_void() +
                    scale_fill_viridis(direction=1),
                  ggraph(white_graph, layout = 'circlepack', weight=value) + 
                    geom_node_circle(aes(fill=depth)) +
                    geom_node_label(aes(label=name,size=value),position=position_jitter(width=.2,height=.2),repel=TRUE,max.overlaps=10) +
                    theme_void() +
                    scale_fill_viridis(direction=1),
                  ggraph(amber_graph, layout = 'circlepack', weight=value) + 
                    geom_node_circle(aes(fill=depth)) +
                    geom_node_label(aes(label=name,size=value),position=position_jitter(width=.2,height=.2),repel=TRUE,max.overlaps=10) +
                    theme_void() +
                    scale_fill_viridis(direction=1))

# pdf("plots.pdf", onefile = TRUE)
# for (i in seq(length(p))) {
#   do.call("grid.arrange", p[[i]])  
# }
# dev.off()

pdf("./plots/hierarch_vis_by_treatments.pdf", onefile = TRUE, w=12, h=12)
par(mfrow=c(1,3))
#layout(matrix(c(1,2,3), 1, 3, byrow = TRUE))
ggraph(control_graph, layout = 'circlepack', weight=value) + 
  geom_node_circle(aes(fill=depth)) +
  geom_node_label(aes(label=name,size=value),repel=TRUE,max.overlaps=10) +
  theme_void() +
  scale_fill_viridis(direction=1)
ggraph(white_graph, layout = 'circlepack', weight=value) + 
  geom_node_circle(aes(fill=depth)) +
  geom_node_label(aes(label=name,size=value),repel=TRUE,max.overlaps=10) +
  theme_void() +
  scale_fill_viridis(direction=1)
ggraph(amber_graph, layout = 'circlepack', weight=value) + 
  geom_node_circle(aes(fill=depth)) +
  geom_node_label(aes(label=name,size=value),repel=TRUE,max.overlaps=10) +
  theme_void() +
  scale_fill_viridis(direction=1)
dev.off()
########################


#from biomass: biomass[, `:=` (MeanTotal = mean(Total), SDTotal = sd(Total)), by = .(StartDate, Treatment)]





########################

# biomass table: total for each Site | StartDate | Treatment
# here, we have these columns, but must make a count table every time we want to filter e.g. by insect type

pdf("./plots/count_all_points.pdf", w=16, h=9)
ggplot(pitfall_names[, .N, by=.(Site, StartDate, Treatment)], aes(x = StartDate, y = N, colour = as.factor(Site))) +
  geom_point() +
  geom_line() +
  labs(y= "Total Count") +
  facet_grid(rows = vars(Treatment))
dev.off()

pdf("./plots/count_points.pdf", w=16, h=9)
ggplot(pitfall_names[, .N, by=.(Site, StartDate, Treatment)], aes(x = StartDate, y = N)) +
  stat_summary(fun = mean, geom = "point") +
  stat_summary(fun.data = mean_se, geom = "errorbar") + 
  labs(y="Mean Total Count") +
  facet_grid(rows = vars(Treatment))
dev.off()



########################
raw_counts <- pitfall_names[, .(N = .N,
                            N_Isopoda = .SD[Class == "Malacostraca",.N]), by=.(Site,StartDate,Distance)]
raw_counts

counts <- dcast(raw_counts, StartDate+Site~Distance, value.var=c("N"))
setnames(counts, c("0m","5m"), c("Near","Far"))
counts[metatable, Treatment := i.Treatment, on=.(Site, StartDate)]

counts <- counts[Treatment %in% c("C","A","W")]

counts$Treatment <- factor(counts$Treatment, levels=c("C","W","A"), ordered = TRUE)


########### HISTOGRAM ############

filtered_pitfall <- metatable[pitfall_names, on = .(StartDate, Site), nomatch = 0]
filtered_pitfall[metatable, Treatment := i.Treatment, on=.(Site, StartDate)]

# divide the number of observations by the number of sites for each StartDate

obs_col_plot <- function(data) {
  count_bar <- as.data.table(data[, .N, by=.(Site, StartDate)][, .N, by=StartDate][order(StartDate)])
  setnames(count_bar, "N", "NumberOfSites")
  count_bar
  count_bar[, TotalObservations := data[, .N, by=StartDate][order(StartDate)]$N]
  count_bar[, Normalised := TotalObservations/NumberOfSites]
  return(ggplot(count_bar, aes(x=StartDate, y=Normalised)) +
    geom_line())
}

library(gridExtra)

all_col <- obs_col_plot(filtered_pitfall)
all_col + labs(y = "Total count divided by number of sites")

c_col <- obs_col_plot(filtered_pitfall[Treatment == "C"])
c_col + labs(y = "Total count under control (darkness) divided by number of sites")

a_col <- obs_col_plot(filtered_pitfall[Treatment == "A"])
a_col + labs(y = "Total count under amber light divided by number of sites")

w_col <- obs_col_plot(filtered_pitfall[Treatment == "W"])
w_col + labs(y = "Total count under white light divided by number of sites")

col_list <- c(all_col, c_col, a_col, w_col)

count_bar <- as.data.table(filtered_pitfall[, .N, by=.(Site, StartDate)][, .N, by=StartDate][order(StartDate)])
setnames(count_bar, "N", "NumberOfSites")
ggplot(count_bar, aes(x=StartDate, y=NumberOfSites)) +
         geom_col()

mcount_bar <- as.data.table(metatable[, .N, by=.(Site, StartDate)][, .N, by=StartDate][order(StartDate)])
setnames(mcount_bar, "N", "NumberOfSites")
ggplot(mcount_bar, aes(x=StartDate, y=NumberOfSites)) +
  geom_point()



filtered_pitfall[, .N, by=.(StartDate, Site, Treatment)][, .N, by=.(Treatment)]
filtered_pitfall[Treatment == "", .N, by=.(StartDate, Site)][order(StartDate)][order(StartDate, Site)]





########### INDEX ############

counts[, Index := Near/(Near+Far), by = .(StartDate,Site)]

ggplot(counts, aes(Treatment, Index)) +
  geom_boxplot() +
  geom_boxplot(outlier.shape = NA) +
  labs(y = "Count statistic") +
  geom_jitter() +
  geom_hline(aes(yintercept = 0.5),colour="red",linetype="dotted")

wilcoxon_count <- data.frame(W = wilcox.test(counts[Treatment == ("W"),Index], counts[Treatment == ("C"),Index], 
            alternative = "two.sided", exact = FALSE)$p.value,
            A = wilcox.test(counts[Treatment == ("A"),Index], counts[Treatment == ("C"),Index], 
            alternative = "two.sided", exact = FALSE)$p.value)
wilcoxon_count

########### 1m rather than index ############


ggplot(counts, aes(Treatment, Near)) +
  geom_boxplot() +
  geom_boxplot(outlier.shape = NA) +
  labs(y = "Count statistic") +
  geom_jitter() +
  geom_hline(aes(yintercept = 0.5),colour="red",linetype="dotted")

wilcoxon_count <- data.frame(W = wilcox.test(counts[Treatment == ("W"),Near], counts[Treatment == ("C"),Near], 
                                             alternative = "two.sided", exact = FALSE)$p.value,
                             A = wilcox.test(counts[Treatment == ("A"),Near], counts[Treatment == ("C"),Near], 
                                             alternative = "two.sided", exact = FALSE)$p.value)
wilcoxon_count

########### 5m ############


ggplot(counts, aes(Treatment, Far)) +
  geom_boxplot() +
  geom_boxplot(outlier.shape = NA) +
  labs(y = "Count statistic") +
  geom_jitter() +
  geom_hline(aes(yintercept = 0.5),colour="red",linetype="dotted")

wilcoxon_count <- data.frame(W = wilcox.test(counts[Treatment == ("W"),Far], counts[Treatment == ("C"),Far], 
                                             alternative = "two.sided", exact = FALSE)$p.value,
                             A = wilcox.test(counts[Treatment == ("A"),Far], counts[Treatment == ("C"),Far], 
                                             alternative = "two.sided", exact = FALSE)$p.value)
wilcoxon_count


 ############# N_ISOPODA ######################

counts <- dcast(raw_counts, StartDate+Site~Distance, value.var=c("N_Isopoda"))
setnames(counts, c("0m","5m"), c("Near","Far"))
counts[metatable, Treatment := i.Treatment, on=.(Site, StartDate)]

counts[, Index := Near/(Near+Far), by = .(StartDate,Site)]

counts <- counts[Treatment %in% c("C","A","W")]

counts$Treatment <- factor(counts$Treatment, levels=c("C","W","A"), ordered = TRUE)

ggplot(counts, aes(Treatment, Index)) +
  geom_boxplot() +
  geom_boxplot(outlier.shape = NA) +
  labs(y = "Count statistic") +
  geom_jitter() +
  geom_hline(aes(yintercept = 0.5),colour="red",linetype="dotted")

wilcoxon_count <- data.frame(W = wilcox.test(counts[Treatment == ("W"),Index], counts[Treatment == ("C"),Index], 
                                             alternative = "two.sided", exact = FALSE)$p.value,
                             A = wilcox.test(counts[Treatment == ("A"),Index], counts[Treatment == ("C"),Index], 
                                             alternative = "two.sided", exact = FALSE)$p.value)
wilcoxon_count








############# N_ISOPODA ######################

counts <- dcast(raw_counts, StartDate+Site~Distance, value.var=c("N_Isopoda"))
setnames(counts, c("0m","5m"), c("Near","Far"))
counts[metatable, Treatment := i.Treatment, on=.(Site, StartDate)]

counts[, Index := Near/(Near+Far), by = .(StartDate,Site)]

counts <- counts[Treatment %in% c("C","A","W")]

counts$Treatment <- factor(counts$Treatment, levels=c("C","W","A"), ordered = TRUE)

ggplot(counts, aes(Treatment, Index)) +
  geom_boxplot() +
  geom_boxplot(outlier.shape = NA) +
  labs(y = "Count statistic") +
  geom_jitter() +
  geom_hline(aes(yintercept = 0.5),colour="red",linetype="dotted")

wilcoxon_count <- data.frame(W = wilcox.test(counts[Treatment == ("W"),Index], counts[Treatment == ("C"),Index], 
                                             alternative = "two.sided", exact = FALSE)$p.value,
                             A = wilcox.test(counts[Treatment == ("A"),Index], counts[Treatment == ("C"),Index], 
                                             alternative = "two.sided", exact = FALSE)$p.value)
wilcoxon_count














# setnames(name_cols, "V1", "FullName")
# name_cols[, Parent := sub("\\/[A-Za-z0-9?._-]+$", "", FullName)]
# name_cols <- subset(name_cols, Parent != FullName)
# name_graph <- graph.data.frame(as.data.frame(name_cols))
# 
# node <- "./Arthropoda"
# setdiff(names(subcomponent(name_graph, node, mode = "out")), node)
# 
# setdiff(names(subcomponent(name_graph, "./Arthropoda", mode = "out")), "./Arthropoda")

#, c_vertices = as.data.frame(pitfall_names)

