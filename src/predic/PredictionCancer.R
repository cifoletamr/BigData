library(rminer)
library(mlbench)
library(caret)

# Cargamos Datos de Cancer de libreria rminer
data(BreastCancer, package="mlbench")
head(BreastCancer)
# summary(BreastCancer)

# complete.cases = Elimina las lineas que no estan completos 
bc <- BreastCancer[complete.cases(BreastCancer),-1]
# mode="stratified" elementos de cada clase en forma proporcional
h <- holdout(bc$Class,ratio=0.9,mode="stratified")

data_train <- bc[h$tr,]
data_test  <- bc[h$ts,]

# method entrenamientp cv = Cross validation de 10 folds
train_control<- trainControl(method="cv", number=10)

# Entrenando con metodo rf=Random Forest
mod<-train(Class~., data=data_train, method="rf", trControl = train_control)

pred <- predict(mod, newdata=data_test)
confusionMatrix(pred,data_test$Class,positive="malignant")
#print(cm$table)
