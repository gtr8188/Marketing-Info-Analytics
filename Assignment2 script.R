test = read.csv("/Users/daniellee/Desktop/BC/Study/Class Resource/2nd/Marketing Infro. Anal./Assignment2/Coffee_Test.csv")
train = read.csv("/Users/daniellee/Desktop/BC/Study/Class Resource/2nd/Marketing Infro. Anal./Class2/Coffee.csv")

model1 = lm(Sales ~ Visits + Price + AdSpend, data=train)
summary(model1)

Predictions = predict(model1, newdata = test)
Predictions

SSE = sum((test$Sales - Predictions)^2)
SST = sum((test$Sales - mean(train$Sales))^2)

1 - SSE/SST 
