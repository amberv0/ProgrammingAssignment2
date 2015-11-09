# usage example:
# x <- makeCacheMatrix()
# cacheSolve(x, m = matrix(1:4, 2, 2)) #will calculate inverse
# cacheSolve(x, m = matrix(1:4, 2, 2)) #run once again, will show a message about cache usage
# cacheSolve(x, m = matrix(2:5, 2, 2)) #changing matrix will cause recalculation
# cacheSolve(x, m = matrix(2:5, 2, 2)) #but run again, no recalculation

#another way to do this:
# x <- makeCacheMatrix(matrix(1:4, 2, 2))
# cacheSolve(x) #will calculate inverse
# cacheSolve(x) #run once again, will show a message about cache usage


## constructs an object needed for the cacheSolve function, has one optional parameter where the matrix can be passed

makeCacheMatrix <- function(x = matrix()) {
  matrixInverse <- NULL
  getMatrix <- function() x
  setMatrix <- function(newMatrix) {
    x <<- newMatrix
    matrixInverse <<- NULL
  }
  setMatrixInverse <- function(x) matrixInverse <<- x
  getMatrixInverse <- function() matrixInverse
  list(
    getMatrix = getMatrix, 
    setMatrix = setMatrix, 
    getMatrixInverse = getMatrixInverse, 
    setMatrixInverse = setMatrixInverse
  )
}


#accepts the "matrix" created by the previous function and an optional second parameter "matrix" where a new matrix can be passed
#if the new matrix is not the same as old, we save it to the "matrix" before calculating inverse

cacheSolve <- function(x, m = NULL) {
  if(!is.null(m) && !(all(dim(x$getMatrix()) == dim(m)) && all(x$getMatrix() == m))){
    x$setMatrix(m)
  }
  if(is.null(x$getMatrixInverse())){
    newInverse <- solve(x$getMatrix())
    x$setMatrixInverse(newInverse)
    return(newInverse)
  }else{
    print("using cached data")
    return(x$getMatrixInverse())
  }
}
