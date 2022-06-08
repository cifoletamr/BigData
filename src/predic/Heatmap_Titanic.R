library(dplyr)
library(rminer)
library(mlbench)
library(caret)
library(rpart.plot)
library(rpart)


titanic_data <- read.csv(file = 'C:/Users/Alumne_mati1/Desktop/BigData/src/dat/train_titanic.csv')
head(titanic_data)
titanic_data = select(titanic_data, -Name,-Ticket,-Cabin, -PassengerId)


titanic_data$Survived <- as.factor(titanic_data$Survived)
head(titanic_data)
str(titanic_data)
set.seed(42)

#Cleanning NA
tc <- titanic_data[complete.cases(titanic_data),]
summary(tc)
h<-holdout(tc$Survived,ratio=0.7,mode="stratified")
data_train<-tc[h$tr,]
data_test<-tc[h$ts,]
train_control<- trainControl(method="cv", number=10)

#Training model
mod<-train(Survived~., data=data_train, method="rf", trControl = train_control)
x_test <- data_test[,2:length(data_test)]
pred <- predict(mod, newdata=x_test)
confusionMatrix(pred,data_test$Survived)





#Disicion Tree

#Training model with rpart.plot
mod<-rpart(Survived~., data=data_train, method="class", xval = 10)
rpart.plot(mod, main = "Árbol de Clasificación")
x_test <- data_test[,2:length(data_test)]
pred <- predict(mod, newdata=x_test, type = 'class')
confusionMatrix(pred,data_test$Survived)

# Download and install heatmaply package
install.packages("heatmaply")
library("heatmaply")

#Heatmap
df <- normalize(titanic_data)
heatmaply(df)
