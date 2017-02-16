train = read.csv("RetailMartTrain.csv", sep = ";", header = TRUE)

str(train)
summary(train)

train$male = as.integer(train$Implied.Gender=="M")
train$female = as.integer(train$Implied.Gender=="F")

train$Implied.Gender = NULL

model1 = lm(PREGNANT ~ Birth.Control, data = train)

summary(model1)

model2 = lm(PREGNANT ~ Birth.Control + Cigarettes, data = train)

summary(model2)

model3 = lm(PREGNANT ~ ., data = train)

summary(model3)

