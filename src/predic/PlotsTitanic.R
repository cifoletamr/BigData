library(dplyr)
library(rminer)
library(mlbench)
library(caret)
library(rpart)
library(rpart.plot)

titanic_data <- read.csv(file = 'C:/Users/Alumne_mati1/Desktop/BigData/src/dat/train_titanic.csv')

# Elimina campos que no son afectan a la predicción
titanic_data = select(titanic_data, -Name,-Ticket,-Cabin, -PassengerId)
#df = mydata[keeps]

# as.factor = pasa el dato de numérico a categórico ("0", "1")
titanic_data$Survived <- as.factor(titanic_data$Survived)

titanic_data <- na.omit(titanic_data)  

plot(titanic_data)
hist(titanic_data$Age)

#plot(titanic_data$Pclass,type = "l", names.arg = titanic_data$Pclass)

boxplot(titanic_data$Age)
stripchart(titanic_data$Age, method = "jitter", pch = 3, add = TRUE, col = "blue")
stripchart(titanic_data$Pclass ~ titanic_data$Survived, vertical = TRUE, method = "jitter",
           pch = 5, add = TRUE, col = 1:length(levels(titanic_data$Survived)))

x = tapply(titanic_data$Survived, titanic_data$Pclass, length)
labels = names(x)

pie(x,label = labels,  main="Per Classe")


set.seed(42)

# Se queda con los datos completos y crea un juego de datos estratificados
tc <- titanic_data[complete.cases(titanic_data),]
h<- holdout(tc$Survived,ratio=0.7,mode="stratified")

data_train<-tc[h$tr,]
data_test<-tc[h$ts,]
train_control<- trainControl(method="cv", number=10)

# Entrena con Random Forest
mod<-train(Survived~., data=data_train, method="rf", trControl = train_control)

# El valor a predecir esta en la columna 2
x_test <- data_test[,2:length(data_test)]

pred <- predict(mod, newdata=x_test)
print(pred)

cm = confusionMatrix(pred,data_test$Survived)

titanic_data2 = select(titanic_data, -Sex, -Survived, -Embarked)
res <- cor(titanic_data2)
round(res, 2)

library(corrplot)
corrplot(res, type = "upper", order = "hclust", 
         tl.col = "black", tl.srt = 45)
palette = colorRampPalette(c("green", "white", "red")) (20)
heatmap(x = res, col = palette, symm = TRUE)