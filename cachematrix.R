## This pair of functions will create an invertible matrix and allow the 
## inverse of that matrix to be cached so it only has to be computed once.

## makeCacheMatrix will create a matrix object that can cache it's inverse.
makeCacheMatrix <- function(x = matrix()) {
        #Initialize inverse variable on creation
        inv_x <- NULL
        
        #Allows user to change the matrix and then clear the cache
        set <- function(y) {
                x <<- y
                inv_x <<- NULL
        }
        
        #Return current matrix
        get <- function() x
        
        #Set inverse variable
        set_inv <- function(inv) inv_x <<- inv
        
        #Return inverse variable
        get_inv <- function() inv_x
        
        #Returns a list derived from the 4 functions above
        list(set = set, 
             get = get, 
             set_inv = set_inv, 
             get_inv = get_inv)

}


## cacheSolve takes the list returned by makeCacheMatrix() as an input.
## cacheSolve will first check to see if the inverse was already cached and
## return that value.  Otherwise, it will compute the inverse, store it, and
## return it.
cacheSolve <- function(x, ...) {
        ## Initialize a local variable with the stored inverse.
        inv_x <- x$get_inv()
        
        ## Check to see if an inverse was cached.
        if(!is.null(inv_x)) {
                message("getting cached inverse")
                return(inv_X)
        }
        
        ## Otherwise, compute inverse and cache it.
        y <- x$get()
        inv_x <- solve(y)
        x$set_inv(inv_x)
        
        ## Return inverse
        inv_x
}
