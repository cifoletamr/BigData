txt = "hello"
paste ("numero caracteres: ", nchar(txt))

txt = "sololearn"
paste ("extreu 1 a 3: ", substr(txt,1,3))
paste ("extreu 5 a 9: ", substr(txt,5,9))

# VECTORS
names = c("James", "Amy", "John", "Dave", "Bob")

print (names[-2])
print (names[2:4])

n <- c(8, 4, 2, 3, 5)
x <- n[2:4]
x <- x[-1]
print(x[1])

# FUNCIONS DELS VECTORS
paste ("sort names:", sort(names))
paste ("longitud names:", length(names))

paste ("sort n:", sort(n))
paste ("suma n:", sum(n))

print(sort(n))

print (n[n > 4])

x <- 5:9
x[3] <- 2
x <- x[x>=7]
print(length(x))

# Aritmètica vectorial : Quina és la sortida d'aquest codi? 
a <- c(1, 2) 
b <- c(3, 4) 
x <- b/a 
print(sum(x))

# VECTORS: Mitjana i Mitja

v = c(1,2,6,5,42)
print (v)
paste ("mean:", mean(v))
paste ("median:", median(v))

#What is the median value of the following data set?

v = c(7, 5, 4, 3)
paste("median", median(v))


# LLISTES
#---------------------------------------------------
x <- list("James", "Bob", c(2, 4, 8), 42)
print(x[[3]])

p <- list("name"="James", "age"="42", "gender"=1, "married"=FALSE)
print(p$name)
p[["country"]] = "Australia"
print(p)

list1 = list ("A", "B", "C")
list2 = list ("D", "E")

lula = c(list1, list2)

print(lula )

# unlist 
list4 = list (4,2,11)
listy = unlist(list4)

print(listy)
print(sort(listy))
print(mean(listy))


