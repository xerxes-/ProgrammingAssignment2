## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(m = matrix()) {               ## input m will be a matrix
  
  inv <- NULL                            ##  inv will store the inverse of mattix and it's reset to NULL every 
  ##  time makeCacheMatrix is called 
  
  set <- function(y) {                   ## takes an input matrix
    
    m <<- y                                ## saves the input matrix 
    
    inv <- NULL                            ## resets the matrix inverse to NULL
    
  }				   
  
  
  get <- function()  m                   ## this function returns the value of the original matrix
  
  
  setinv <- function(solve){             ## this is called by cacheSolve() when the inverse is not calculated before
    
    inv <<- solve                          ## it will store the value using superassignment
    
  }
  
  
  getinv <- function()  inv              ## this will return the cached value to cacheSolve()
  
  
  list(set = set, get = get, setinv = setinv, getinv = getinv)   ## It lists all the functions that are part of the matrix object
  
  
  
}



## Write a short comment describing this function

cacheSolve <- function(m = matrix(), ...){       ## the input is an object created by makeCacheMatrix
  ## Return a matrix that is the inverse of 'm'
  inv <- m$getinv()                  ## accesses the object 'm' and gets the value of the inverse of matrix
  
  if(!is.null(inv)){                 ## if mean was already cached
    
    message("getting cached data")     ## a message will be displayed on screen
    
    return(inv)						 ## inverse of matrix will be returned
    
  }
  
  data <- m$get()                    ## if the previous statement returns NULL, this statement will be evaluated
  
  inv <- solve(data, ...)            ## the inverse of matrix is calculated
  
  m$setinv(inv)                      ## store the calculated inverse in m
  
  inv                                ## returns the inverse of matrix
  
  
}
