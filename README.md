
###usage example:
```
x <- makeCacheMatrix()
cacheSolve(x, m = matrix(1:4, 2, 2)) #will calculate inverse
cacheSolve(x, m = matrix(1:4, 2, 2)) #run once again, will show a message about cache usage
cacheSolve(x, m = matrix(2:5, 2, 2)) #changing matrix will cause recalculation
cacheSolve(x, m = matrix(2:5, 2, 2)) #but run again, no recalculation
```

another way to do this:
```
x <- makeCacheMatrix(matrix(1:4, 2, 2))
cacheSolve(x) #will calculate inverse
cacheSolve(x) #run once again, will show a message about cache usage
```