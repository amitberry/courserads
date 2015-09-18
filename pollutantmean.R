specdata <- data.frame() ## creates empty dataframe specdata
for (i in 1:332) {
  specdata <- rbind(specdata, read.csv(files_full[i]))
} ## populates specdata dataframe with data from all 332 air pollutant csv files
str(specdata) ## displays results
write.csv(specdata, "specdata.csv", row.names=TRUE, na="") ## saves specdata dataframe to a csv

spdf <- read.csv("specdata.csv") ## loads the specdata csv as dataframe named spdf
spdf_30 <- spdf[which(spdf[, "ID"] %in% 30),] ## subsets spdf by ID, in this case ID #30
mean(spdf_30$sulfate, na.rm = TRUE) ## calculates the mean of sulfate values for monitor ID #30 and removes NAs

## Creating a function called "pollutantmean to do all of that
pollutantmean <-function(directory, pollutant, id = 1:332) {
  files_list <- list.files(directory, full.names=TRUE)   ##creates a list of all of specdata files
  spdf <- data.frame()                             ##creates an empty data frame named spdf
  for (i in 1:332) {                                ##loops through the files, rbinding them together 
    spdf <- rbind(spdf, read.csv(files_list[i]))
  }
  spdf_subset <- spdf[which(spdf[, "ID"] %in% id),]  ##subsets the rows that match the 'id' argument
  mean(spdf_subset[, "nitrate"], na.rm=TRUE)      ##identifies the mean for sulfate values while stripping out NAs
}

pollutantmean(directory = "specdata", pollutant = "sulfate", id = 30) 
##should run the function and return the mean for sulfate from monitor #30
pollutantmean("specdata", "nitrate", 70:72)
##should run the function and return the mean for nitrate from monitors #70, 71, and 72
pollutantmean("specdata", "sulfate", 34)
##should run the function and return the mean for nitrate from monitor #34
pollutantmean("specdata", "nitrate")
##should run the function and return the mean for nitrate from all monitors
