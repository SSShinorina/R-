install.packages(leaps)
library(faraway)
blood
summary(blood)

# a
plot(blood$BP,blood$Age)
plot(BP~Weight, data=blood)
plot(BP~BSA, data=blood)
plot(BP~Dur, data=blood)
plot(BP~Pulse, data=blood)
plot(BP~Stress, data=blood)

# b
model_weight = lm(BP~Weight, data = blood)
summary(model_weight)
plot(BP~Weight, data=blood)

model_age = lm(BP~Age, data = blood)
summary(model_age)
plot(BP~Age, data=blood)

model_bsa = lm(BP~BSA, data = blood)
summary(model_bsa)
plot(BP~BSA, data=blood)

model_dur = lm(BP~Dur, data = blood)
summary(model_dur)
plot(BP~Dur, data=blood)

model_pulse = lm(BP~Pulse, data = blood)
summary(model_pulse)
plot(BP~Pulse, data=blood)

model_stress = lm(BP~Stress, data = blood)
summary(model_stress)
plot(BP~Stress, data=blood)

# c)  statistically significant F test
drop1(model_weight,scale=phi,test="F")

#d
model = lm(BP ~ ., data=blood)
summary(model)

### e)  BIC ####
library(leaps)
model_bic = regsubsets(BP ~ ., data=blood)
rs = summary(model_bic)
rs$which
plot(1:6, rs$bic, ylab="BIC", xlab="Number of predictors (p-1)")
reduce_model = lm(BP~Age+Weight+BSA,data=blood)
summary(reduce_model)

### f) multicollinearity
cor(blood)
model_cor = lm(BP~.-(Weight),data=blood)
summary(model_cor)

#g
summary(model_weight)
summary(model)
summary(reduce_model)
summary(model_cor)

anova(model_weight, model, reduce_model, model_cor)

######      h)
######### constant variance assumptions ##########
plot(model_cor,1)
plot(model_cor, 3)

#######  normality assumptions #######
qqnorm(residuals(model_cor))
qqline(residuals(model_cor))
shapiro.test(residuals(model_cor))

###### large leverage point ######
hatv = hatvalues(model_cor)
sum(hatv)
bp = rownames(blood)
halfnorm(hatv, labs=bp, ylab="Leverages")
abline(h=2*sum(hatv)/nrow(sat))


##### outliers ######
p = 3
alpha = 0.05
cr_value = qt(alpha/(2*n), n-p-1, lower.tail = F)
cr_value

sr1 = rstudent(model_cor)
which(abs(sr1)>cr_value)
plot(sr1)


###### influential point ######
cook = cooks.distance(model_cor)
halfnorm(cook, 3, labs=bp, ylab="Cook's distances")


######## i) level interval ######
blood [c(1),]
 
x0=data.frame(Age=47,Dur=5.1,BSA=1.75,Weight=85.4,Pulse=63,Stress=33)
predict(model_cor,x0,0.95)
