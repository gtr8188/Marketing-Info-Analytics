//** this is my comment **//
  3+4
a=4
a*5
a=a*10
a=4
a=a+10
#vectors
b = c(3,4,5)
b[2]
b[3]=b[3]+5
b
#vectors sequence
c = seq(from=1, to =5, by=1)

#matrices
A = matrix(data = (c=seq(from=1,to=6, by=1)),ncol= 3)
A[2,3]
A[2,3]=A[2,3]+4
A[2,]

#data frames

t = data.frame(sales = c(234,345,877),Adspend = c(4,6,8))
t$sales
t$sales[3]

#squareroot
sqrt(144)
sqrt(t$sales[3])

mean(t$sales)

#concessions data
setwd("~/Desktop/BC/Study/Class Resource/2nd/Marketing Infro. Anal./DataSet")
getwd()
data = read.csv("Concessions_data.csv", header = TRUE)
mean(data$Price)
sum(data$Actual.Profit)

#subset - Analysis on Hamburgers
Burgers = subset(data,data$Item == "Hamburger")
sum(Burgers$Actual.Profit)

#plotting
plot(data$Price, data$Actual.Profit)

