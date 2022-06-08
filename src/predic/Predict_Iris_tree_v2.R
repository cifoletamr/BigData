library(rminer)
library(mlbench)
library(caret)
library(rpart)
library(rpart.plot)


data(iris)
summary(iris)

set.seed(42)
bc = iris

h<-holdout(bc$Species,ratio=0.8,mode="stratified")
data_train<-bc[h$tr,]
data_test<-bc[h$ts,]
length(data_test)

# Create a decision tree model
mod <- rpart(Species~., data=data_train, method = "class",xval= 10)

# Visualize the decision tree with rpart.plot
rpart.plot(mod, main = "Árbol de Clasificación")
x_test <- data_test[,1:length(data_test)-1]
y_test <- data_test[,5]
pred <- predict(mod, newdata=x_test,type="class")
confusionMatrix(pred,y_test)
