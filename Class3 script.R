train = read.csv("/Users/daniellee/Desktop/BC/Study/Class Resource/2nd/Marketing Infro. Anal./Class3/RetailMartTrain.csv",sep = ";",header = TRUE)
test = read.csv("/Users/daniellee/Desktop/BC/Study/Class Resource/2nd/Marketing Infro. Anal./Class3/RetailMartTest.csv",sep = ";", header = TRUE)
#change this path to your working directory to read in the datasets from there


train = read.csv("RetailMartTrain.csv",sep=";",header=TRUE)
test = read.csv("RetailMartTest.csv", sep=";", header=TRUE)

str(train)
summary(train)

#Creating dummy variables
train$Male=as.integer(train$Implied.Gender=="M")
train$Female=as.integer(train$Implied.Gender=="F")
train$Implied.Gender=NULL #deleting the original variable which we don't need anymore
train$Home=as.integer(train$Home.Apt..PO.Box=="H")
train$Apt=as.integer(train$Home.Apt..PO.Box=="A")
train$Home.Apt..PO.Box=NULL

str(train)


#Explaining pregnancy with linear models
model1 = lm(PREGNANT ~ Birth.Control + Cigarettes, data=train)
summary(model1)

model2 = lm(PREGNANT ~ ., data=train) #The "." will include all variables except PREGNANT in the regression
summary(model2)

#Prediction in sample
#train$Predictions = predict(model2, newdata = train)

#Predicting pregnancy out-of-sample

Predictions = predict(model2, newdata = test)
Predictions

#Performance assessment (out of sample R square)
SSE = sum((test$PREGNANT - Predictions)^2)
SST = sum((test$PREGNANT - mean(train$PREGNANT))^2)

# Compare the result w/ the R square of the model

1 - SSE/SST 

