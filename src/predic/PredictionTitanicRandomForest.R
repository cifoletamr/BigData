library(dplyr)
library(rminer)
library(mlbench)
library(caret)
library(rpart)
library(rpart.plot)

titanic_data <- read.csv(file = 'C:/Users/Alumne_mati1/Desktop/BigData/src/dat/train_titanic.csv')

# Elimina campos que no son afectan a la predicción
titanic_data = select(titanic_data, -Name,-Ticket,-Cabin)
#df = mydata[keeps]

# as.factor = pasa el dato de numérico a categórico ("0", "1")
titanic_data$Survived <- as.factor(titanic_data$Survived)
head(titanic_data)
summary(titanic_data)
str(titanic_data)
set.seed(42)

# Se queda con los datos completos y crea un juego de datos estratificados
tc <- titanic_data[complete.cases(titanic_data),-1]
h<- holdout(tc$Survived,ratio=0.7,mode="stratified")

data_train<-tc[h$tr,]
data_test<-tc[h$ts,]
train_control<- trainControl(method="cv", number=10)

# Entrena con Random Forest
mod<-train(Survived~., data=data_train, method="rf", trControl = train_control)

# El valor a predecir esta en la columna 2
x_test <- data_test[,2:length(data_test)]  

pred <- predict(mod, newdata=x_test)
confusionMatrix(pred,data_test$Survived)


# Create a decision tree model
mod <- rpart(Survived~., data=data_train, method = "class",xval= 10)

# Visualize the decision tree with rpart.plot
rpart.plot(mod, main = "Árbol de Clasificación")
