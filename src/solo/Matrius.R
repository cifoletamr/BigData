# MATRIUS 

m = matrix( c(1:6), nrow=2, ncol=3)
print(m)

print(m[1,3])
print(m[1,])
print(m[,1])

a <- matrix(c(8, 0, 2, 5), ncol = 2)
print(a)
a <- t(a)
print(a)
print(a[2, 1])


m5 <- matrix(c("apple","banana","cherry","orange","grape",
               "pineapple","pear","melon","fig"), nrow =3, ncol =3)
m6 <-cbind(m5, c("strawberry","blueberry","raspberry"))
# Print the new matrix
m6
     
m7 <-rbind(m5, c("strawberry","blueberry","raspberry"))
# Print the new matrix
m7

thismatrix <- matrix(c("apple", "banana", "cherry", "orange", 
                       "mango", "pineapple"), nrow = 3, ncol = 2)

#Remove the first row and the first column
thismatrix <- thismatrix[-c(1), -c(1)]

print(thismatrix)

if ("apple" %in% thismatrix) {
  print ("Tengo manzanas")
}

if ("mango" %in% thismatrix) {
  print ("Tengo mango")
}
# Dataframes
x = data.frame("id"=1:2, 
               "name" = c("James", "Amy"), 
               "edat"=c(42, 18))

print(x[[2,3]])

# Afegir elemenents, i filtrar per criteris

x$country = c("USA", "Italy")
print(x[x$edat>21,1])
subset(x, edat>21)


print(x[x$edat>21,1 & x$id < 2])

print(subset (x, edat <50  & id >  0))

print(mean(x$edat))
summary(x)

# Factors d'un dataframe
gender <- factor(c("Male", "Female", "Male")) 
print(levels(gender))
print(table(gender))

# Questionari : What is the output of this code?
x <- c(6, 1, 8, 3)
y <- min(x)
z <- max(x)
res <- sum(x)-z-y
print(res)

# What is the output of this code?
  
x <- matrix(c(3, 1, 0, 8, 5, 3), nrow = 3)
print(x)
print(x[3, 1])


# What is the output of this code?
  
x <- data.frame(
    "a" = c(7, 42, 3, 5), 
    "b" = c("a","b","c","d")
  )
y <- subset(x, a < 10)
z <- max(y$a)
print(y)
print(z)
print(mean(y$a))
print(min(mean(y$a), z))






