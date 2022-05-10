install.packages("ResourceSelection")
library('faraway')
library('ResourceSelection')
data(africa)
?africa
summary(africa)

# a
plot(miltcoup~oligarchy,data=africa)
plot(miltcoup~parties,data=africa)
plot(miltcoup~popn,data=africa)
plot(miltcoup~size,data=africa)
plot(miltcoup~numelec,data=africa)
plot(miltcoup~numregim,data=africa)

model = lm(miltcoup ~ . -(pollib+pctvote), data=africa)
summary(model)

summary (model$miltcoup)
model$miltcoup <-factor(model$miltcoup)
summary (model$miltcoup)

summary (model$oligarchy)
model$oligarchy <-factor(model$oligarchy)
summary (model$oligarchy)

summary (model$parties)
model$parties <-factor(model$parties)
summary (model$parties)

summary (model$popn)
model$popn <-factor(model$popn)
summary (model$popn)

summary (model$size)
model$size <-factor(model$size)
summary (model$size)

summary (model$numelec)
model$numelec <-factor(model$numelec)
summary (model$numelec)

summary (model$numregim)
model$numregim <-factor(model$numregim)
summary (model$numregim)

# b
model1 = glm(miltcoup ~ .-(pollib+pctvote) ,family=poisson, data = africa)
summary(model1)
plot(model1$fitted.values,model1$residuals)
abline(0,1)

1-pchisq(model1$deviance,model1$df.residual)

######     c)   6 simple linear model ###########
m_oligarchy = glm(miltcoup ~ oligarchy,family=poisson, data=africa)
summary(m_oligarchy)
 
m_numelec  = glm(miltcoup ~ numelec,family=poisson, data=africa)
summary(m_numelec)

m_parties = glm(miltcoup ~ parties,family=poisson, data=africa)
summary(m_parties)

m_numregim = glm(miltcoup ~ numregim,family=poisson, data=africa)
summary(m_numregim)

m_popn = glm(miltcoup ~ popn,family=poisson, data=africa)
summary(m_popn)

m_size = glm(miltcoup ~ size,family=poisson, data=africa)
summary(m_size)

###### d) significant test ######
drop1(m_oligarchy,test="Chisq")
drop1(m_numelec ,test="Chisq")
drop1(m_parties,test="Chisq")
drop1(m_numregim,test="Chisq")
drop1(m_popn,test="Chisq")
drop1(m_size,test="Chisq")


#### e) 
model2 = glm(miltcoup ~ . ,family=poisson,data=africa)
summary(model2)

### f
model0 = glm(miltcoup ~ oligarchy+popn+numregim+numelec+parties+size,family=poisson,data=africa)
step(model0)

model3 = glm(miltcoup ~ oligarchy + numelec,family=poisson,data=africa)
anova(model0,model3)

anova(model0, model3, test='Chisq')

#### g interpretation
exp(coef(model3))

#### h) model adequate
1-pchisq(model3$deviance,model3$df.residual)
plot(model3$fitted.values,model3$residuals)
abline(0,1)

#### i) over/under dispersion
r= residuals(model3,type="pearson")
X=sum(r^2)
sigma2=X/model3$df.residual
sigma2

