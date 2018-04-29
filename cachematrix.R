## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## Initiating the x as matrix inside the function args

makeCacheMatrix <- function(x = matrix()) {

## Initialising the inverse of the matrix as inv to NULL

   inv <- NULL

   
   set <- function(y) {

## Assigning the y matrix to x (global variable initialised inside the fucntion args)     
## Initialising the inverse of the matrix as inv to NULL
## Similar to makeCacheMatrix function
     x <<- y
    inv <<- NULL
   }
## get function to get the matrix
  get <- function() x
## set the value of Inverse of the given matrix 
  setsolve <- function(solve) inv <<- solve
## get the value of Inverse of the given matrix  
  getsolve <- function() inv
  
## deifining the names for the functions mentioned above  
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}


## Write a short comment describing this function

## matrix is passed to the function as is assigned as x

cacheSolve <- function(x, ...) {

## Initialising inverse of the matrix by using getsolve function  
  inv <- x$getsolve()
  
## condition to check if the inverse of the matrix inv is null or not. If inv is present it means the 
## inverse is already calculated before and it gives message saying "getting cached data"
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
## if inverse of matrix is not present then the matrix is stored in data and then inverse is
##calculated using solve function
  
  data <- x$get()
  inv <- solve(data, ...)
## set the inverse of the matrix value to inv by using setsolve function  
  x$setsolve(inv)
  inv
        ## Return a matrix that is the inverse of 'x'
}

## Result

# >new_mat <- matrix(1:4,2,2)

# > x <- makeCacheMatrix(new_mat)

# > x$get()
#       [,1] [,2]
# [1,]    1    3
# [2,]    2    4

# > cacheSolve(x)
#       [,1] [,2]
# [1,]   -2  1.5
# [2,]    1 -0.5

# > cacheSolve(x)
# getting cached data
#      [,1] [,2]
# [1,]   -2  1.5
# [2,]    1 -0.5
