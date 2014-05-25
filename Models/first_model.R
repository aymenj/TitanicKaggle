#============================
#Using GLMS to Classifiy Wine
#============================

#=========
#Libraries
#=========


library(randomForest) #random forests

#====
#Data
#====

train = read.csv('train.csv',header=T)
test = read.csv('test.csv',header=T)

train$Survived = factor(train$Survived)
train$Pclass = factor(train$Pclass)
test$Pclass = factor(test$Pclass)
train$Sex = factor(train$Sex)
test$Sex = factor(test$Sex)
train$Embarked = factor(train$Embarked)
test$Embarked = factor(test$Embarked)


formula = Survived ~ Pclass + Sex + Age +SibSp +Parch
rf = randomForest(formula,data=train,method="anova",na.action=na.roughfix)
plot(rf)

predictions = predict(rf,test[,c("Pclass","Sex","Age","SibSp","Parch","Embarked")],na.action=na.roughfix)
write.csv(predictions,"first_model.csv",row.names = T)
