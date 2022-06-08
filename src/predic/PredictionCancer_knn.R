library(rminer)
library(mlbench)
library(caret)
data(BreastCancer, package="mlbench")
summary(BreastCancer)
bc <- BreastCancer[complete.cases(BreastCancer),-1]
set.seed(42)
h<-holdout(bc$Class,ratio=0.7,mode="stratified")
data_train<-bc[h$tr,]
data_test<-bc[h$ts,]
train_control<- trainControl(method="cv", number=10)
mod<-train(Class~., data=data_train, method="knn", trControl = train_control)
pred <- predict(mod, newdata=data_test)
confusionMatrix(pred,data_test$Class,positive="malignant")
