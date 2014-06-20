## Use these matrix to test the functions
## either this
theData <- c(4,7,2,6)
## or this
theData<- c(1:4)
a <- matrix(theData, 2,2)

##Caching function that allows you to set the matrix 
makeCacheMatrix <- function(x=matrix()){
  m <- NULL
  set<- function(y){
    x<<-y
    m<<-NULL
  }
  get<- function() x
  setInverse<- function(solve) m<<-solve
  getInverse<- function() m
  
  list(set=set,get=get,setInverse=setInverse, getInverse=getInverse)
}

## initialize the function
b<- makeCacheMatrix()
## set the data
b$set(a)

## it will see if the cache is still valid and display it
## if not it will obtain the Inverse matrix and display it
cacheSolve <- function(x,...){
  m<- x$getInverse()
  if(!is.null(m)){
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <-solve(data)
  x$setInverse(m)
  return(m)
}

## run the function to obtain inverse
cacheSolve(a)

## run again to see that cache is used
cacheSolve(a)