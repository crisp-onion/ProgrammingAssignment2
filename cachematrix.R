## Put comments here that give an overall description of what your
## functions do

## Rather than being a function, this is a list of functions. That really took me a moment to wrap my head around.

makeCacheMatrix <- function(x = matrix()) {
  inverse <<- NULL
  
  #sub-function that sets new matrix and removes old cached inverse
  set <- function(y) {
    x <<- y
    inverse <<- NULL
  }
  
  #sub-function that returns the matrix
  get <- function() x
  
  #sub-function that allows a solved value to be passed in from elsewhere
  setinv <- function(solved) inverse <<- solved
  
  #sub-function that returns cached value
  getinv <- function() inverse
  
  #Print out contents of function as a list when called
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)

}


## pulls already stored inverse if present
#if statement computes inverse if getinv is empty
#else statement returns getinv if present
#will fail if not specifically calling matrix set in above

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x', or already stored value
  
  i <- x$getinv()
  
  if(is.null(i)) {
    inv <- solve(x$get())
    x$setinv (inv)
    inv
    
  } else {
    print('Cached =')
    i
  }
}
