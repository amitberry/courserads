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
