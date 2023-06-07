rm(list = ls(all = TRUE))
locations <- read.csv(file="~/Documents/alan_setup/sites_2023.csv",header=T,sep=",")
locations <- data.frame(cbind(locations$Latitude,locations$Longitude))
colnames(locations) <- list("latitude","longitude")

#xy <- cbind(rnorm(1000),rnorm(1000))

n <- 6
best_avg <- 0
best_set <- NA
for (i in 1:12){
  subset <- locations[sample(1:nrow(locations),n),]
  avg <- mean(dist(subset))
  if (avg > best_avg & !any(dist(subset)<0.001)) {
    best_avg <- avg
    best_set <- subset
  }
}

# library(geosphere)
 distm(c(locations[7,2],locations[7,1]), c(locations[3,2],locations[3,1]), fun = distHaversine)
# 
# checkdist <- function(newpt,bestset) { 
#   for (i in nrow(bestset)) {
#     if (distm(c(newpt[2],newpt[1]), c(bestset[i,2],bestset[i,1]), fun = distHaversine)<100) {
#       return(0)
#     }
#   }
#   return(1)
# }


plot(locations$latitude,locations$longitude)
text(locations$latitude+0.0001,locations$longitude, labels=c(1:12))
points(best_set$latitude,best_set$longitude,col="red",pch=16)
