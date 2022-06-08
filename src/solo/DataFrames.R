#-----------------------------------------
# Creant un DataFrame directament
#-----------------------------------------
input <- readline(prompt="Nota: ")
x <- as.integer(input[1])

datos <- data.frame(
  "id" = c(1:10),
  "grade" = c(75, 26, 54, 90, 86, 93, 48, 71, 66, 99)
)

print(datos$grade)
res = datos[datos$grade > x,]
print(res)
print(nrow(res))

#-----------------------------------------
# Llegin un csv com un Dataframe
#-----------------------------------------

data <- read.csv("C:/Users/Alumne_mati1/Desktop/BigData/src/dat/mtcars.csv") 
dim(data)


# x = mtcars[mtcars$am == 0,]
# x[x$qsec == min(x$qsec),]
# 
# print (x)

# res = cor(mtcars)
# res = round(res,2)
# print(res)

#by (mtcars$hp, mtcars$am, mean)


tapply(mtcars$hp, mtcars$am , mean) 