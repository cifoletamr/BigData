iris <- read.csv(file = 'Iris.csv')
head(iris)
summary(iris)

# Descarta linea de cabeceras y la columna de Spcies
iris_numbers<-iris[2:(length(iris)-1)]
head(iris_numbers)

# Matriu de correlacions i boxplots
cor(iris_numbers)
str(iris)
boxplot(iris_numbers)

iris_x<-iris[1:(length(iris)-1)]

#install.packages(c("caret", "klaR"), dependencies = TRUE)
library(caret)
library(klaR)

data(iris)

set.seed(8675309)  # Para que todas las ejecucuiones dan lo mismo


# define an 80%/20% train/test split of the dataset
split=0.80
trainIndex <- createDataPartition(iris$Species, p=split, list=FALSE)


data_train <- iris[ trainIndex,]
data_test <- iris[-trainIndex,]

# Entrena un model Naive bayes model
model <- NaiveBayes(Species~., data=data_train)

# make predictions  x_test = variables entreda y_test = classe solució
x_test <- data_test[,1:4]
col_resultat <- data_test[,5]
predictions <- predict(model, x_test)

# summarize results
confusionMatrix(predictions$class, col_resultat)

