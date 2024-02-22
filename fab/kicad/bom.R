library(splitstackshape)
library(tidyverse)
setwd("~/Documents/alan-setup/fab/kicad")
bom <- read.csv("controller_pcb.csv",skip=8)
head(bom)
bom
bom$Value
bom$Value_1


cbind(bom$Reference.s.,bom$Value)
# for all entries with commas in Reference.s.
# add a row
bom

bom <- separate_rows(bom, Reference.s.)


bom15 <- read.csv("15VBOM.csv")
cbind(bom15$Part,bom15$Part.Number)

bom5 <- read.csv("5VBOM.csv")
cbind(bom5$Part,bom5$Part.Number)
bom5$Part <- paste(bom5$Part,"-2",sep="")
bom5$Part <- str_to_upper(bom5$Part)
bom[,bom5$Part]














setwd("~/Documents/alan-setup/fab/kicad")

des1 <- read.csv("WBBOMDesign2.csv")
des2 <- read.csv("WBBOMDesignTPS55289RYQR.csv")

intersect(des1$Part.Number,des2$Part.Number)
des2[6,3] <- "UUD1V680MCL1GS"
des2[12,3] <- "MSS1210-103MED"
des2

des3 <- read.csv("WBBOMDesign3.csv")
length(intersect(des2$Part.Number,des3$Part.Number))
des3[des3$Part.Number != des2$Part.Number,]
des3[des3$Part.Number == des2$Part.Number,]

cbind(des2$Part.Number,des3$Part.Number)

des3$Part.Number %in% des2$Part.Number

des5v <- read.csv("5VBOM.csv")
des5v

cbind(des5v$Part.Number[order(des5v$Part.Number)])

des_1a <- read.csv("1ABOM2.csv")

setdiff(des3$Part.Number,des_1a$Part.Number)
setdiff(des_1a$Part.Number,des3$Part.Number)
des3[!(des3$Part.Number %in% des_1a$Part.Number),]
des_1a[!(des_1a$Part.Number %in% des3$Part.Number),]

des_1a



des5v2 <- read.csv("5VBOM2.csv")

des5v2[!(des5v2$Part.Number %in% des_1a$Part.Number),]

des5v2









# R1:
  # Part = "R1"
  # Manufacturer = ""
  # Part.Number = ""
  # Quantity = ""
  # Price = ""
  # Footprint.mm.. = ""
  # Description = "Resistance: 100 k"
ds3231 <- data.frame()