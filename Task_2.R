packageName('faraway')
library(faraway)
data(sat)
sat
summary(sat)

plot(sat$takers,sat$verbal)
plot(takers~math, data=sat)

plot(verbal~total, data=sat)
plot(math~total, data=sat)

mdl <- lm (total ~ takers, data=sat)

residuals(mdl)
deviance(mdl)
fitted(mdl)
coef(mdl)

summary(mdl)


x<-model.matrix(~ takers, data=sat)
y<-sat$total
#estimate
xtxi<-solve(t(x)%*%x)
# Find beta estimates
beta=xtxi%*%t(x)%*%y

reg_mdl <- lm (total ~ taakers+verbal+math, data=sat)