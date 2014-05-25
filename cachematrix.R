## Functions to cache the inverse of a matrix

## Create a matrix object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  #creates list of functions for getting inverse of matrix
  m <- NULL
  set <- function(y){
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinv <- function(solve) m <<- solve
  getinv <- function() m
  list(set = set, get = get, setinv = setinv, getinv = getinv)
  
}


## calculates inverse of matrix if not already cached

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- $getinv()
  if(!is.null(m)){
    return(m)
  }
  data <- x$get
  m <- solve(data)
  x$setinv(m)
  m
}



