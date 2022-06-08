## Put comments here that give an overall description of what your
## functions do

    ## creates a special "matrix" object 
    ## that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  
    ## set get function
  
  get <- function() x
  setInverse <- function(inverse) m <<- inverse
  getInverse <- function() m
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}

    ## computes the inverse of the special "matrix" 
    ## returned by makeCacheMatrix above.

cacheSolve <- function(x, ...) {
  
    ## Return a matrix that is the inverse of 'x'
  
  m <- x$getInverse()
  if ( ! is.null(m)) {
    print("getting cached data")
    return(m)
  }
  m <- solve(x$get())
  x$setInverse(m)
  m
}
