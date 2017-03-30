mydata = read.csv("/Users/daniellee/Downloads/Cars.csv")

model1 =lm(RSD~.-Model, data = mydata)
summary(model1)

model2 = lm(RBK ~ vs+am, data = mydata)
summary(model2)

#modified
model2.1 = lm(RBK ~.-Model - RSD, data = mydata)
summary(model2.1)

model3 = lm(RSD + RBK ~.-Model, data = mydata)
summary(model3)

#modified

model3.1 = lm(RBK ~ RSD, data = mydata)
summary(model3.1)
#since the RSD is negative and is significant, so the two cars have different preferences
