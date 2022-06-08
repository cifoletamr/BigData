#define the function
rangeSum <- function(x, y) {
  suma <- 0
  for (i in x:y) {
    print (i)
    suma <- suma +  i
  }
  return(suma)
}


x <- readline(prompt="Enter x: ")
y <- readline(prompt="Enter y: ")

result <- rangeSum(x, y)
print(result)


