QWE = read.csv("/Users/daniellee/Desktop/BC/Study/Class Resource/2nd/Marketing Infro. Anal./Class6/QWE_data.csv")
?aggregate
?barplot

# Case question 2
CSum = aggregate(Churn ~ CustomerAge, data = QWE, FUN = sum)
barplot(CSum$Churn)
axis(1,at= CSum$CustomerAge)

# 3
model1 = glm(Churn ~. -Customer_ID, family = "binomial", data = QWE)
summary(model1)
step(model1)

model2 = step(model1)
summary(model2)
# Null deviance means no IDV vs Residual deviance (w/ IDV), then test whether the difference is significant

# Test whether the model is significant:
# 2553.1 - 2441.0 imprical Chi-square analysis -> Get therotical Chi square value
# Check the Chi square: distribution table (0.05->5% significant level), df = # of IDVs =14.07
# Then can decide the model is significant -> significant since the imprical > therotical

# 4
#There is a positive probability for CustomerAge to the Churn

# 5
exp(coef(model2))
# For an increase of 1 month in the CustomerAge, the chance of Churn incerease by factor 1.01

# 6
# Create the prob column
QWE$ChurnProb1 = predict(model2, data = QWE, type = "response")
# response is for probilibities, type response return the logit

# plot the result 
plot(mydata$CustomerAge,mydata$ChurnProb1)
# Compare the two plots, the model explains the increase, but not the decrease, not a good model



#install.packages("ROCR",dependencies=TRUE)
library(ROCR)
ChurnProb1.RC = prediction(ChurnProb1,QWE$Churn)
perf1 <- performance(ChurnProb1.RC,"tpr","fpr")
plot(perf1,xlim=c(0,1),ylim=c(0,1))
ChurnProb2.RC = prediction(ChurnProb2,QWE$Churn)
perf2 <- performance(ChurnProb2.RC,"tpr","fpr")
plot(perf2,xlim=c(0,1),ylim=c(0,1),lty=2)
plot(perf1,xlim=c(0,1),ylim=c(0,1))
plot(perf2,xlim=c(0,1),ylim=c(0,1), lty=2, add=TRUE)