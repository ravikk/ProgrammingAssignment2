## R Programming Class - Assignment II

## Author : Ravi Reddy

## The following code addresses the Method Closures and the understanding around caching time consuming functions.

## The code returns the inverse of a square matrix.

## The code creates a list of functions.
makeCacheMatrix <- function(x = matrix()) {
        inverseMatrix <- NULL ## set the internal variable to null

        set <- function(y) { ## creating the set function to assign the incoming matrix to the internal variable
        x <<- y
        inverseMatrix <<- NULL ## clearing the internal variable
    }

        get <- function() x  ## reading the value the the incoming matrix to the variable get

        setsolve <- function(solve) {
                inverseMatrix <<- solve  ## assigning the internal variable to the cacheSolve variable
                }

        getsolve <- function() inverseMatrix  ## reassigning the internal variables, the keep all the variables

        list(set = set, get = get,
                setsolve = setsolve,
                getsolve = getsolve)
}

## The following set of instructions create the inverse matrix using the solve function and also stores the value
## for quick recall of the cached value

cacheSolve <- function(x, ...) {
        inverseMatrix <- x$getsolve() ## receiving the incoming matrix
## if the internal variable is not null, the following message will be passed along with the cached data, saving
## cpu time

        if(!is.null(inverseMatrix)) { ## checking the value of the internal variable
        message("getting cached data")
        return(inverseMatrix)
    }

## These following set of instructions are executed only when a new variable is passed


        data <- x$get()  ## reading the matrix into a local variable data

        inverseMatrix <- solve(data, ...) ## performing the time/cpu sensitive operation solve to invert the matrix

        x$setsolve(inverseMatrix) ## assigning the calculated value to the solved variable

        inverseMatrix ## returning the internal variable with the solved variable to the parent function
        }
