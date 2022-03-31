packageName('faraway')
library(faraway)
data(teengamb)
teengamb
summary(teengamb)
hist(teengamb$sex)
hist(teengamb$status)
hist(teengamb$income)


x=1:10
y=1:10

#find beta estimates
xtxi<-solve(t(x)%*%x)
beta=xtxi%*%t(x)%*%y
