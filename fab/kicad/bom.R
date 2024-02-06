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

des_5v <- read.csv("5VBOM.csv")
des_5v

cbind(des_5v$Part.Number[order(des_5v$Part.Number)])



