library(rminer)
library(mlbench)
library(caret)

# Cargamos Datos de Iris de libreria rminer
data(iris)

iris_x <-iris[1:(length(iris)-1)]
head(iris_x)
set.seed(42)

# complete.cases = Elimina las lineas que no estan completos 
bc <- iris_x[complete.cases(iris_x),]

# define an 80%/20% train/test split of the dataset
split=0.80
trainIndex <- createDataPartition(iris$Species, p=split, list=FALSE)

data_train <- iris[ trainIndex,]
data_test <- iris[-trainIndex,]

# method entrenamientp cv = Cross validation de 10 folds
train_control<- trainControl(method="cv", number=10)

# Entrenando con metodo rf=Random Forest
mod<-train(Species~., data=data_train, method="rf", trControl = train_control)

pred <- predict(mod, newdata=data_test)
confusionMatrix(pred,data_test$Species)

