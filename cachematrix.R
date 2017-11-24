## Two functions that are used to create a special object that stores
## a numeric matrix and caches its inverse
## ----------------------------------------------------------------------------
## This function creates a special "matrix" object that can cache its inverse.
## Really a list containing 4 functions to:

## 1.  set the value of the matrix
## 2.  get the value of the matrix
## 3.  set the value of the inverted matrix
## 4.  get the value of the inverted matrix

makeCacheMatrix <- function(x = matrix()) {
    invertedMatrix <- NULL
    set <- function(y) {
        x <<- y
        invertedMatrix <<- NULL
    }
    get <- function() x
    setInverse <- function(inverse) invertedMatrix <<- inverse
    getInverse <- function() invertedMatrix
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}


## Calculates the inverse of the special "matrix"
## created with the above function ('makeCacheMatrix').
## However, it first checks to see if the inverted matrix has already been calculated.
## If so, it 'get's the value from the cache and skips the computation.
## Otherwise, it calculates the inverted matrix of the input matrix
## and sets the value of the invertedMatrix in the cache via the 'setInverse' function.

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    im <- x$getInverse()
    if(!is.null(im)) {
        message("getting cached data")
        return(im)
    }
    data <- x$get()
    im <- solve(data, ...)
    x$setInverse(m)
    im
}
