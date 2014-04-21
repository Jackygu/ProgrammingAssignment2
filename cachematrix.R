## The first function creates a list containing four functions
## The second function calculates the inverse of a matrix

## This function creates some basic functions for the entire program

makeCacheMatrix <- function(x = matrix()) {
    ## Set the initial inv variable to be NULL
    inv <- NULL
    ## Set the value of the matrix
    set <- function(y){
        x <<- y
        inv <<- NULL
    }
    ## Get the value of the matrix
    get <- function() x
    ## Change the inv variable to be the inversed matrix
    set_inverse <- function(inverse) inv <<- inverse
    ## Get the inversed matrix
    get_inverse <- function() inv
    ## List the four functions created in this function
    list(set = set, get = get, 
         set_inverse = set_inverse, 
         get_inverse = get_inverse)
}


## This function calculates the inverse of a matrix

cacheSolve <- function(x, ...) {
    ## Set the value of inv
    inv <- x$get_inverse()
    ## Return the inversed matrix if it's already inversed
    if(!is.null(inv)){
        message("getting cached data")
        return(inv)
    }
    ## If the matrix hasn't been inversed
    ## Return a matrix that is the inverse of 'x'
    data <- x$get()
    inv <- solve(data)
    x$set_inverse(inv)
    inv
}
