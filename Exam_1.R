install.packages(leaps)
library(faraway)
data(blood)
blood
summary(blood)

#a
plot(blood$BP,blood$Age)
plot(BP~Weight, data=blood)
plot(BP~BSA, data=blood)
plot(BP~Dur, data=blood)
plot(BP~Pulse, data=blood)
plot(BP~Stress, data=blood)

#b
summary(model)
plot(BP~Weight, data=blood)
model1 = lm(BP~Weight, data = blood)
model1

#d
model = lm(BP ~ Age+Weight+BSA+Dur+Pulse+Stress, data=blood)
summary(model)
anova(model1, model)

#e
library(leaps)
combos = regsubsets(BP ~ Age+Weight+BSA+Dur+Pulse+Stress, data=blood)
rs = summary(combos)
rs$which
plot(1:6, rs$bic, ylab="BIC", xlab="Number of predictors (p-1)")
selected = lm(BP ~ Age + Weight, data=blood)
summary(selected)

#f
plot(1:6, rs$adjr2, ylab="Adjusted R^2", xlab="Number of predictors (p-1)")
model2 = lm(BP ~ . -(Dur+Pt), data = blood)
summary(model2)
model3 = lm(BP ~ . -(Dur+Pt+Pulse), data = blood)
summary(model3)
model4 = lm(BP ~ . -(Dur+Pt+Pulse+Stress), data = blood)
summary(model4)

#g
anova(model, model1, selected, model4)

#h
######### constant variance assumptions ##########
plot(model4, 1)
plot(model4, 3)


#######  normality assumptions #######
qqnorm(residuals(model4))
qqline(residuals(model4))


###### large leverage point ######
hatv = hatvalues(model4)
sum(hatv)
bp = rownames(blood)
halfnorm(hatv, labs=bp, ylab="Leverages")
abline(h=2*sum(hatv)/nrow(sat))


##### outliers ######
p = 4
alpha = 0.05
cr_value = qt(alpha/(2*n), n-p-1, lower.tail = F)

sr1 = rstudent(model4)
which(abs(sr1)>cr_value)


###### influential point ######
cook = cooks.distance(model4)
halfnorm(cook, 3, labs=bp, ylab="Cook's distances")


########  level interval ######
confint(model4,level = 0.95)
