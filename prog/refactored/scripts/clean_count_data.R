library(ggplot2)
library(data.table)
library(igraph)

pitfall_names <- fread("./raw_data/pitfall_classification_filenames.txt", header = FALSE)

setnames(pitfall_names, "V1", "FullName")
#2023-08-05_1_A_5m002_0040_5763_8740_0004.png
#StartDate_Site_Treatment_Distance

pitfall_names <- pitfall_names[grep("debris", FullName, invert = TRUE)]
pitfall_names <- pitfall_names[grep("multiple_insects", FullName, invert = TRUE)]
pitfall_names$FullName <- gsub(" ", "_", pitfall_names$FullName)
pitfall_names[, c("Root","Filename") := tstrsplit(FullName, "\\/+(?!\\S*\\/)", perl = TRUE)]
pitfall_names[, c("Root","Phylum","Class","Order","Family","Subfamily","Genus","Species") := tstrsplit(Root, "/")]
pitfall_names[, c("StartDate", "Site", "PrescribedTreatment", "Distance") := tstrsplit(Filename, "_", fixed = TRUE, type.convert = TRUE)[1:4]]
pitfall_names[, Distance := strtrim(Distance, 2)]
pitfall_names[, StartDate := as.Date(StartDate)]
pitfall_names[, id := .I]

metatable <- fread("./cleaned_data/metadata.csv")
metatable <- metatable[!is.na(Site)]

raw_counts <- pitfall_names[, .(N = .N,
                              N_Isopoda = .SD[Class == "Malacostraca",.N]), 
                              by=.(Site,StartDate,Distance)]

# option 1: wide table where there's a column for the count of each
# option 2: change setup of counts table OR setup of tables
# probably just dynamically obtain count for taxon of interest?
# also don't widen table to get near and far columns...use == instead

# raw_counts <- pitfall_names[, .(N = .N,
#                             N_Isopoda = .SD[Class == "Malacostraca",.N]), 
#                             by=.(Site,StartDate,Distance)]
raw_counts

counts <- dcast(raw_counts, StartDate+Site~Distance, value.var=c("N"))
setnames(counts, c("0m","5m"), c("Near","Far"))
counts[metatable, Treatment := i.Treatment, on=.(Site, StartDate)]

counts <- counts[Treatment %in% c("C","A","W")]

counts$Treatment <- factor(counts$Treatment, levels=c("C","W","A"), ordered = TRUE)




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
