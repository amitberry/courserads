add2 <- function(x, y) {
  x + y
}

## Next function takes a vector of numbers and return a subset of the vector that's above the value of 10
above10 <- function(x) {
    ## Next create a logical statement that figures out which elements of the vector x are greater than 10
  use <- x > 10
  x[use]
    ## "use" is arbitrary that we assigned. That will return a subset of elements that are greater than 10
}

## Function that will allow people to extract elements of vector that are above another arbitrary number (allow user to specify the number)
above <- function(x, n){
  use <- x > n
  x[use]
}

## Example of what above looks like 
## > x <- 1:20
## > n <- 12
## > above(x, n)
## [1] 13 14 15 16 17 18 19 20
## > 

## Let's set the default argument for above
above <- function(x, n = 10){
  use <- x > n
  x[use]
}

## If you run:
## > above(x) it will return
## [1] 11 12 13 14 15 16 17 18 19 20
## >

### Next function takes a matrix or data frame that calculates the mean for each column
### This will take your argument and loop through each column to calculate the mean for each one
## columnmean <- function(y, removeNA = TRUE){
  ### y is a dataframe. how many columns does this have? nc or number of columns will calculate that using ncol function

  ## nc <- ncol(y)
    ### initialize a vector that stores the means for each column. this is a numeric vector with the same length as the column. it's an empty vector that we'll fill
  ## means <- numeric(nc)
    ### now we'll for loop through the columns to create an integer vector that starts with 1 and ends with the number of columns
  ## for(i in 1:nc){
    ### for each i we'll assign to the means vector
    ## means[i] <- mean(y[, i], na.rm = removeNA)
  ##}
    ### now we'll return the means.
  ##means
##}

## Without columns that function looks like:
columnmean <- function(y){
  nc <- ncol(y)
  means <- numeric(nc)
  for(i in 1:nc){
    means[i] <- mean(y[, i], na.rm = removeNA)
  }
  means
}

## When we run that on the airquality dataset we get:
## > columnmean(airquality)
## [1]        NA        NA  9.957516 77.882353  6.993464 15.803922

## That gave us 6 means for the 6 cols of the dataset
## First two means aren't calculated since there are NAs in the dataset
## We can add the argument removeNA = TRUE to the function to get rid of them and calculate the mean of the observed values
## Then pass that value to the means argument using na.rm = removeNA

columnmean <- function(y, removeNA = TRUE){
  nc <- ncol(y)
  means <- numeric(nc)
  for(i in 1:nc){
    means[i] <- mean(y[, i], na.rm = removeNA)
  }
  means
}

## When we run that on the airquality dataset we get:
## > columnmean(airquality)
## [1]  42.129310 185.931507   9.957516  77.882353   6.993464  15.803922
## > 
  
