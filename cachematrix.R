## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## this function receives a matrix as a parameter a returns a list of four functions (two setters and two getters)
## one setter and getter for the matrix attribute and the other two for the inverse attribute.
library(MASS)

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setInverse <- function(inverse) inv <<- inverse
  getInverse <- function() inv
  list(set = set,
       get = get,
       setInverse = setInverse,
       getInverse = getInverse)
  
}


## Write a short comment describing this function
## this function receives the object returned by makeCacheMatrix() and determines if the inverse is already calculated
## in that case the function returns the cached inverse, otherwise it is calculated and save in cache memory.
cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inv <- x$getInverse()
  if (!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  mat <- x$get()
  inv <- solve(mat, ...)
  x$setInverse(inv)
  inv
}

test <- makeCacheMatrix()
test$set(matrix(1:4, 2))
test$get()
cacheSolve(test)
cacheSolve(test)