mydata = read.csv("/Users/daniellee/Desktop/BC/Study/Class Resource/2nd/Marketing Infro. Anal./Class5/App.csv")

?glm
#Check the data
str(mydata)
summary(mydata)
plot(mydata$Interface, mydata$Purchase)
plot(mydata$LoadTime, mydata$Purchase)

#Run the logistic model
model1 = glm(Purchase ~ Interface, data = mydata, family = "binomial")

summary(model1) #Linear affect on the Z value

exp(coef(model1)) #Calculate the odds ratio
#For an increase of 1 unit in the interface, the chance of buying incerease 1.22

#Compare model1
model2 = glm(Purchase ~ Interface + LoadTime, data = mydata, family = "binomial")
summary(model2) #Linear affect on the Z value
#Positie on Interface and Negatice on LoadTime
#AIC is lower, better
exp(coef(model2))
#9.605967e-01 smaller than one, the chance of buying decrease

#Max
logLik(model1)
logLik(model2)