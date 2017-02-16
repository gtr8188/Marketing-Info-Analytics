mydata = read.csv("/Users/daniellee/Desktop/BC/Study/Class Resource/2nd/Marketing Infro. Anal./Class4/Fueling Sales at EuroPet - Data.csv")
summary(mydata$Sales)
summary(mydata$TV)
summary(mydata$Radio)
summary(mydata$Fuel.Volume)

?plot

WeekPlot = plot(mydata$Sales,mydata$Week)
TVPlot = plot(mydata$Sales,mydata$TV)
RadioPlot = plot(mydata$Sales,mydata$Radio)
FVPlot = plot(mydata$Sales,mydata$Fuel.Volume)

model1 = lm(Sales ~ Fuel.Volume, data = mydata)
summary(model1)