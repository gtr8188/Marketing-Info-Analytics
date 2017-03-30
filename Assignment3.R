train = read.csv("/Users/daniellee/Desktop/BC/Study/Class Resource/2nd/Marketing Infro. Anal./Class3/RetailMartTrain.csv",sep = ";", header =TRUE)

train$male = as.integer(train$Implied.Gender=="M")
train$female = as.integer(train$Implied.Gender=="F")
train$home = as.integer(train$Home.Apt..PO.Box=="H")
train$apartment = as.integer(train$Home.Apt..PO.Box=="A")
train$PO = as.integer(train$Home.Apt..PO.Box=="P")

train$Implied.Gender = NULL
train$Home.Apt..PO.Box = NULL

model1 = glm(PREGNANT ~ ., data = train, family = "binomial")

summary(model1) #Linear affect on the Z value
step(model1) # test different model to find out the best model


question1 = glm(formula = PREGNANT ~ Pregnancy.Test + Birth.Control + Feminine.Hygiene + 
      Folic.Acid + Prenatal.Vitamins + Prenatal.Yoga + Body.Pillow + 
      Ginger.Ale + Sea.Bands + Stopped.buying.ciggies + Cigarettes + 
      Smoking.Cessation + Stopped.buying.wine + Wine + Maternity.Clothes + 
      male, family = "binomial", data = train)
summary(question1)
exp(coef(question1))
#For an increase of 1 unit in the Folic.Acid, the chance of pregnant incerease by factor 58.9
