## I copied the makeVector example and switch from calculating mean to creating 
## a matrix object that can cache its inverse.
## set input x as a matrix, m to inverse, setmean to setinverse, getmean to 
## getinverse.

makeCacheMatrix <- function(x = matrix()) {
inv <- NULL
set <- function(y) {
  x <<- y
  inv <<- NULL
}
get <- function() x
setinverse <- function(inverse) {inv <<- inverse}
getinverse <- function() {inv}
list(set = set, get = get,
     setinverse = setinverse,
     getinverse = getinverse)
}


## The below function computes the inverse of the matrix

cacheInverse <- function(x, ...) {
  inverse<- x$getinverse()
    if(!is.null(inv)){
      message("getting cache data")
      return(inv)
    }
  matrixx <- x$get()
  inv <- solve(matrixx, ...)
  x$setinverse(inv)
  inv
      
}
