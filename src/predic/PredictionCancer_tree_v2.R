library(rminer)
library(mlbench)
library(caret)
library(rpart)
library(rpart.plot)
#------------------ Obtener datos de la libreria
data(BreastCancer, package="mlbench")
summary(BreastCancer)
head(data[2])
# Hay 700 registros con 10 parametros patológicos, y el resultado
#                             Class=benign, malignant
#------------------ Extrae solo los casos completos y los llama bc
bc <- BreastCancer[complete.cases(BreastCancer),-1]

set.seed(42)  # Fijamos la base aleatoria

#Escogemos muestreo estratificado, con 70% para training
# holdout genera estructura de datos con $tr = training i $ts = test
h<-holdout(bc$Class,ratio=0.7,mode="stratified")

data_train<-bc[h$tr,]
data_test<-bc[h$ts,]
length(data_test)

# Create a decision tree model
mod <- rpart(Class~., data=data_train, method = "class",xval= 10)

# Visualize the decision tree with rpart.plot
rpart.plot(mod, main = "Árbol de Clasificación")
x_test <- data_test[,1:length(data_test)-1]
y_test <- data_test[,10]
pred <- predict(mod, newdata=x_test,type="class")
confusionMatrix(pred,y_test)
