### If you're grading this, you already know what these functions do


## This functin makes a special object, a matrix that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  m <- matrix()
  set <- function(y) {
    x <<- y
    m <<- matrix()
  }
  get <- function() x
  setinverse <- function(inverse) m <<- inverse
  getinverse <- function() m
  
  list(set = set,
       get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## This function computes the inverse of a matrix of the type made by the other function

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if(!is.na(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
}

## Some test code
# A <- matrix(c(2,2,7,8), nrow=2, ncol=2)
# aMatrix <- makeCacheMatrix(A)
# aMatrix$get()
# aMatrix$getinverse()
# cacheSolve(aMatrix)
# aMatrix$getinverse()


