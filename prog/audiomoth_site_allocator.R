rm(list = ls(all = TRUE))
locations <- read.csv(file="~/Documents/alan_setup/2023_ALAN_streetlight_sites.csv",header=T,sep=",")
locations <- data.frame(cbind(locations$Latitude,locations$Longitude))
colnames(locations) <- list("latitude","longitude")
plot(locations$latitude,locations$longitude)
text(locations$latitude+0.0001,locations$longitude, labels=c(1:12))



pointdist <- function(a, b) distm(c(locations[a,2],locations[a,1]), c(locations[b,2],locations[b,1]), fun = distHaversine)

n <- 6
best_avg <- 0.00374
best_set <- NA
dist_pass <- FALSE
all_sub_sets <- combn(1:12, 6, simplify = FALSE)
counter <- 1
# while the sub_set's distance matrix has any value that's less than 0.001
while (!dist_pass & counter < 925){
  for (i in 1:12){
    #sub_set <- locations[sample(1:nrow(locations),n),]
    print(all_sub_sets[counter],)
    print(locations[unlist(all_sub_sets[counter]),])
    sub_set <- locations[unlist(all_sub_sets[counter]),]
    print("sub_set: ")
    print(sub_set)
    avg <- mean(dist(sub_set))
    if (avg > best_avg) {
      dist_pass = !any(dist(sub_set)<0.0013)
      print("dist_pass: ")
      print(dist_pass)
      if (dist_pass) {
        print("passed the test: ")
        print(dist(sub_set)) 
      }
      best_avg <- avg
      best_set <- sub_set
    }
    counter <- counter + 1
  }
}

plot(locations$latitude,locations$longitude, xlim = rev(range(locations$latitude)), ylim = rev(range(locations$longitude)))
text(locations$latitude+0.0001,locations$longitude, labels=c(1:12))
points(best_set$latitude,best_set$longitude,col="red",pch=16)
