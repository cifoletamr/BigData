#png(file = "./chart.png")

# Exemple de plt amb dades d'un rang
plot(1:10, main="Exemples", xlab="son les x", ylab="son les y")
plot(1:10, type ="l")

# Exemple gràfic de linies
line1 = c(8, 8, 14, 22)
line2 = c(2, 12, 6, 8)
plot(line1, type="l", col="blue")
lines(line2, type="l", col="red")


# Exemple gràfic de linies
x1 <- c(1, 10)
y1 <- c(1, 10)
x2 <- c(1, 10)
y2 <- c(10, 1)
plot(x1, y1, type = "l")
lines(x2, y2, type="l")


data <- read.csv("C:/Users/Alumne_mati1/Desktop/BigData/src/dat/mtcars.csv") 

# Dades de cotxes
x = mtcars$wt
y = mtcars$drat
plot(x,y, xlab="pes", ylab="tracció trasera")

# Exemple  grafic de barres
#barplot(mtcars$hp)
barplot(mtcars$hp, names.arg = rownames(mtcars))
plot(mtcars$hp, names.arg = rownames(mtcars), horiz = TRUE)

# Exercici 
data <- c(10, 42, 8, 100)
x <- c("B", "Z", "Y", "A")
barplot(data, names.arg = x)

x = c(8, 10, 42, 14)
y = c("A", "B", "C", "D")
pie(x, label=y)

# Agrupa per gear i treu mitjana de hp
x = tapply(mtcars$hp, mtcars$gear, mean)
labels = names(x)

pie(x, label = labels, main="Mitjana HP per Gears")

x <- tapply(mtcars$wt, mtcars$hp, length)
pie(x)

boxplot(mtcars$mpg)
hist(mtcars$hp)

# Quiz 
a <- c(3, 2, 8, 9) 
b <- c(7, 5) 
c <- c(4, 8, 2, 10) 
plot(a, type = "l") 
lines(b, type="l") 
lines(c, type="l")

